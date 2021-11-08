Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AA0B4498F5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Nov 2021 17:03:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239336AbhKHQFf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Nov 2021 11:05:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231755AbhKHQFe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Nov 2021 11:05:34 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4444C061714
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Nov 2021 08:02:49 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id d5so27771924wrc.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Nov 2021 08:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8vAP0/smT10scjNRgPBTGipkba7IQbJFUmVsZltLLbM=;
        b=NlJ0dzrhwsI+PIHtV8DNA9if9rCTIRo07+Kp12SmuZF9yrnHvT9kwDNOrTUlO42f+S
         On/UlC6AYqt5WUYBBOwD3XIeFde3M4UMZvqtevR9gatyeFykuCItvt4HyhGEqPxSfjCg
         cqWPidWFTjZ2jbMSvjZHeS5mvemYY/FhHTNZWvUtrO2mCacgfh/HRaoF4S8g1L3O9q3E
         orZVKESdLKXvin0pEQ9DytuTgsIaaRylfUz0hlULEUIUC9bE/BybeGUS08E7Oespk+WZ
         JP5kPtWFkdiwfHdt9nJxgA67NZabDgVlAFkr1ZNE5i8C7WlIOBRIXRG5kcbxcwDdpu2i
         YXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8vAP0/smT10scjNRgPBTGipkba7IQbJFUmVsZltLLbM=;
        b=nUbsEEFSCqewQh5xHRlOAv/oad4iq/WmZpph3AK4R+H+6lIERS6+oiZpyIDJ26DeIF
         ngEcB71MRwte60Mx+WWAwJBGWNkJJ1sjiqGey1u8uzPfCWn7mC1RdqWetoR3nBh66Vly
         ObMYTobzuGGPi0zbRaeJZSkocUv1MvG/ylKsmMNeYXYbFhCC0y7x68YgaEYZjGtz/oLo
         fG4SQkfcllPJqXLv+kkYu+hE2xBTT9CKZ8FF6EGMpW7aqmu1xeBsoAg4n9TtnT/qMXIr
         ozz2blGHPSToueVnZADyyABZcaN/lpceVswDF0Wz0C7CmTZmY5beZRy0UbtXcasHicUP
         Q8DA==
X-Gm-Message-State: AOAM530twZfuI3ShqnjkUe387RodCRdDRpGe67CSTrF9ChkcVqJkZWSU
        6r/mGJRbkJGGK1lCPMniejGKQg==
X-Google-Smtp-Source: ABdhPJxKzkpGXl2/zwCLSevFelF00cNosG3fmT9AeS80//iffmC+gEFqc3A4Rkl8LK/WccvlwedDwg==
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr189788wrd.369.1636387368467;
        Mon, 08 Nov 2021 08:02:48 -0800 (PST)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id d16sm12703176wmb.37.2021.11.08.08.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 08:02:48 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/4] media: videobuf2: Add a transfer error event
Date:   Mon,  8 Nov 2021 17:02:16 +0100
Message-Id: <20211108160220.767586-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This series adds a new V4L2 event, V4L2_EVENT_XFER_ERROR. This new event 
is intended to be used when a device in the capturing pipeline 
encounters an unrecoverable error and needs to inform the capturing 
application thru the video node about the error.

The fist use-case for this is also demonstrated in this series by the 
R-Car CSI-2 receiver that generates the new event when it detects an 
error on the bus.

Patch 1/4 is a bug fix for the R-Car VIN driver that was found while 
working on this series. This patch is good to be picked-up on it's own 
but is a requirement for later patches in this series so I have opted to 
include it here as the first patch. 

Patch 2/4 adds the new V4L2 event. While patch 3/4 and 4/4 makes use of 
it in the R-Car capture pipeline. Careful readers will note that the 
last to patches already have a patch history. This is because they have 
been part of an earlier attempt a while back to solve this issue in a 
different way, and during those discussions the need for this new event 
was found.

Niklas Söderlund (4):
  media: rcar-vin: Free buffers with error if hardware stop fails
  media: videobuf2: Add a transfer error event
  rcar-vin: Stop stream when subdevice signal transfer error
  rcar-csi2: Do not try to recover after transfer error

 .../userspace-api/media/v4l/vidioc-dqevent.rst  |  5 +++++
 .../media/videodev2.h.rst.exceptions            |  1 +
 drivers/media/platform/rcar-vin/rcar-csi2.c     | 17 +++++++++--------
 drivers/media/platform/rcar-vin/rcar-dma.c      | 10 ++++++++++
 drivers/media/platform/rcar-vin/rcar-v4l2.c     | 17 ++++++++++++++++-
 include/uapi/linux/videodev2.h                  |  1 +
 6 files changed, 42 insertions(+), 9 deletions(-)

-- 
2.33.1

