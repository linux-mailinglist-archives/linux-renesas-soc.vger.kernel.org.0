Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B788366EAB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Apr 2021 17:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240280AbhDUPDK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Apr 2021 11:03:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243654AbhDUPDJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Apr 2021 11:03:09 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28427C06174A
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Apr 2021 08:02:35 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id j12so24724318edy.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Apr 2021 08:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NcyaPCi9HGWrM3Te0czniEQfj/pMH8UNeHA9+F44ye0=;
        b=EYmXfgqkmOYbGVaOpM5WQycpmwruB2mq5S1jerhSGet7YxOhUOkioJzMnutPSc+mO9
         WfLq5XuXAXVMSOTHuMK5kEZEwN1/5xm6AW1GsvRDvjPNtx0xVfQPQdRN1QHALr8g/Gzr
         sYEN3sD7ap4U00W6X9DULjjFzMw2DFC7eUEnVnVmLWzDq7zAKmID3DIB/9mfqhpkX9aO
         ARV3tBNPMauVaZvI/zU9dPp8z9UPi6BjfbDs0cdQ8oS1wzXGTQ4TcMkJgxX3YvjNvMf1
         eEEtopHx5/gkjwdeWZStMcKzhS3VoF7JyJB4ISPFU02wo3rr7Z+uJiM7BZi+hRT7WoOk
         MXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NcyaPCi9HGWrM3Te0czniEQfj/pMH8UNeHA9+F44ye0=;
        b=oF/mBpJuArNyq13nlhxjrWbwUD10EdISYLv1ZTWvZOH4vgE8DisIS0xhey4VTYf3f5
         iSbJ/7vctdJRFpngBv2D4I6HBusO/P+YKNqbSrLaNIFeZJkq3Nip6vs7YjiqUoGDwJlE
         9SNFQVSbMKLKcfe2X9fWVfSDT6ci2GLvAuaFVhkLIx+S8eNCEKMezP63ztgOsOe9ee8V
         z5i+EWjGdBKMj7zNpt0NqamkQxHVqPtJgf8Ow2C7zoogDXvDSuvbYP57EflWfWxjn6kZ
         6eBYYbi6Q51jn2NvVE2yEhHkK6g8turRMHDYMpnTTDzxrKvZCXrPMccbfPly5g7mxrKf
         lnDg==
X-Gm-Message-State: AOAM532tfOdHuh9DRSPvL7kWl9hiQ9kxVrvZR//Chu892+1XzUX0QHyT
        t8SG+HvhY2aysRnbat8D5N8cDRVSRKg6Gm9yYxk=
X-Google-Smtp-Source: ABdhPJzHNr4qYHX/W2oys7usKh1aU0lRsorFvuxgXe930YFa2hQglf33ggc6e93w+XlNIlP/TrY+Pg==
X-Received: by 2002:a05:6402:518c:: with SMTP id q12mr39773130edd.11.1619017353891;
        Wed, 21 Apr 2021 08:02:33 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de. [84.172.85.33])
        by smtp.googlemail.com with ESMTPSA id g11sm3692588edt.35.2021.04.21.08.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 08:02:33 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] arm64: dts: renesas: Fix CSI-2 validation errors
Date:   Wed, 21 Apr 2021 17:02:19 +0200
Message-Id: <20210421150221.3202955-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

This series fixes all current validation warnings/errors touching CSI-2 
nodes. Patch 1/2 fixes an unspecified port while patch 2/2 deals with 
the fallout of [1] that made the port@0 node explicitly mandatory.

Tested on-top of latest renesas-drivers for all in tree DTB files with  
'make dtbs_check'.

1. commit 066a94e28a23e04c ("media: dt-bindings: media: Use graph and video-interfaces schemas")

Niklas Söderlund (2):
  arm64: dts: renesas: aistarvision-mipi-adapter-2.1: Fix CSI40 ports
  arm64: dts: renesas: Add port@0 node for all CSI-2 nodes to dtsi

 ...hihope-rzg2-ex-aistarvision-mipi-adapter-2.1.dtsi |  2 --
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi            |  8 ++++++++
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi            |  8 ++++++++
 .../boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts     |  2 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi            |  4 ++++
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi            |  8 ++++++++
 arch/arm64/boot/dts/renesas/r8a77950.dtsi            |  4 ++++
 arch/arm64/boot/dts/renesas/r8a77951.dtsi            | 12 ++++++++++++
 arch/arm64/boot/dts/renesas/r8a77960.dtsi            |  8 ++++++++
 arch/arm64/boot/dts/renesas/r8a77961.dtsi            |  8 ++++++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi            |  8 ++++++++
 arch/arm64/boot/dts/renesas/r8a77970.dtsi            |  4 ++++
 arch/arm64/boot/dts/renesas/r8a77980.dtsi            |  8 ++++++++
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts       |  2 --
 arch/arm64/boot/dts/renesas/r8a77990.dtsi            |  4 ++++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi     |  3 ---
 16 files changed, 85 insertions(+), 8 deletions(-)

-- 
2.31.1

