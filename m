Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBB7B47F5CD
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Dec 2021 09:25:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231705AbhLZIZo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 26 Dec 2021 03:25:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231415AbhLZIZo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 26 Dec 2021 03:25:44 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD240C06173E
        for <linux-renesas-soc@vger.kernel.org>; Sun, 26 Dec 2021 00:25:43 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id h21so8707858ljh.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 26 Dec 2021 00:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FAYkYUz34vDfmPxF9cy0ZNORdc1GXTwn4ICVP/BMoeo=;
        b=Cdt9njQ060eTyJ482U+YmuZasI/aoW/AM6k2Om4IrjblKbsfMfX3Ns9Rn7Nb7npeSK
         W7YCyd0cp3i2poh2rJHnMKAtEm616s607HuytrKTTP39/WXqTBmvymG5ZtmPHjinu8G6
         qyhp2jYO23FZs8x+hOR3SEkM45hSOBNpvoJuPgLm5CDvwBhxj1pzhrBdw7RSzycQhFlX
         Gp3CGZNSnzHa4VVwIIJDdMm5IqxKMTbLIjOHaynaTJiUIrs4vW5aYMrDzNA7pQLwgYn7
         m9u+q6RnYu45Ipo3By7QBLREPRbgtn9bBjdOZFlzbeRPjzMQNTaKCYw8nuTCNmI8gfjH
         y84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FAYkYUz34vDfmPxF9cy0ZNORdc1GXTwn4ICVP/BMoeo=;
        b=gKAdZ6rKke+g6Qk1V2qsJ1Bll0eTj8mTGdeZ28xNDXO1TllKtwYMKZOAXA7QLN5DNl
         XjZzEVm9mgcgr+y24Ulmz+fy2G+FLYSgHRC0evlCuEDpRuVCMsklTokGIenP95B1QVkl
         +lo6H9ZMewOV9RN30ATBi31UHfpa7jdCKmyWogEO7rSIsJ6G/beZwBaZnz8sNkISgYFr
         S9cOpdN5WLX61Xw9J+Raj91kTC6/dJ8mDJAtSal2h4P7yJ8/lZ5Q7byNMdRdRmSixlRO
         Xf8mLDo7hYWHLyqggmDhn4L15IVAfGnl4mctO0q9JpTCXln8JnP1qdh/OLKvObXCt+DJ
         4XEA==
X-Gm-Message-State: AOAM532B3uIudsdCFE/MLKPcMS5xFLI/5gd9TL6PmGKu7a0pQ7mflaHP
        j8eM2j1pvRgTAdE5fNtxURg2iA==
X-Google-Smtp-Source: ABdhPJwCLnovYDajFgtC0vLk0ZLarDVxe6L3Q7U94afPWmYrblYqmeKO0tAwOlv0+033UervqZyfyQ==
X-Received: by 2002:a2e:50c:: with SMTP id 12mr9269654ljf.57.1640507141836;
        Sun, 26 Dec 2021 00:25:41 -0800 (PST)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id z5sm1309023lfd.184.2021.12.26.00.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Dec 2021 00:25:41 -0800 (PST)
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christian Gromm <christian.gromm@microchip.com>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH 0/3] Renesas R-Car Gen3: add support for MOST device
Date:   Sun, 26 Dec 2021 11:25:27 +0300
Message-Id: <20211226082530.2245198-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch set applies misc fixes to the MOST dim2 driver, and adds MOST
device definition to dtsi files for R-Car Gen3 SoCs that have it.

Nikita Yushchenko (3):
  staging: most: dim2: update renesas compatible string
  staging: most: dim2: use consistent routine naming
  arm64: dts: renesas: add MOST device

 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 13 +++++++++++
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 13 +++++++++++
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 13 +++++++++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 13 +++++++++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 13 +++++++++++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 13 +++++++++++
 drivers/staging/most/dim2/dim2.c          | 28 +++++++++++------------
 7 files changed, 92 insertions(+), 14 deletions(-)

-- 
2.30.2

