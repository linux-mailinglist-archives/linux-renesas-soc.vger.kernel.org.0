Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B299D42998C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Oct 2021 00:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235609AbhJKXAQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Oct 2021 19:00:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235598AbhJKXAP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Oct 2021 19:00:15 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73145C06161C
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Oct 2021 15:58:14 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id e3so27207189wrc.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Oct 2021 15:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZlsRZNfvSzGTWi21318I6BU3NjmBGIkRAKsEQydD1UU=;
        b=BR5ARso6vid5H4M8/bbu6VMTMHOh+hl33zQwZZayVGIVN0ig3irjPQ3dkoyV9PkS3e
         Qj+hl9zfqciAu5AbBDc5J1Xh8X1L7goAgaiBK/albb0JUCYavvSaT/z2IhjUFD3wBJFl
         US/QX5JvCn2E+Q9kx38LfmbegiHqyychjc/NOtqXaYOS7FWPqUZcswlqW22EwZdck8CQ
         UuvKmlPZfsX4Cjw+L9rwIIGtqMrtSa49p78txhb9o2mOAAdo5PQsFlz5Zw4EQ/SBne6Z
         FwyMf8XNk/8WjymFDVBcqPz2+0/dIz3ihjA44nZwz6JkLFDVpxfkkQVB60Ozlou9JBWN
         eS1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZlsRZNfvSzGTWi21318I6BU3NjmBGIkRAKsEQydD1UU=;
        b=av0Phldpn0jgZFsBImpcPnznj9pG3B0cdteZWSfn2/2dBfLUgiHzFL2CfCA2yAXzQV
         Hd/QcV03/iEalsJcd/pwZTJ/JQCR8O1TCqtRX6K7MtujfAhvwLTV+f/byVc4HzZ7MHfb
         pNye88W6+JmNWoIebvHAJO2lWQ9Ihm1/Ida32tabl2VlyZW/+2dMBHLsgpS+AEuliyMy
         8a4exAf0iJx/JNXswGyTOgzPsUj3Kh1ug2ZgO3TJ1W/wYg8yrYbL2qylLh0ygGJ9UdVE
         X21lFJeH9KY23ZLmnf1airOnwUNJLzeSDGStAV89vozmDc117+k7ZgoD42/c0X776xmw
         odcQ==
X-Gm-Message-State: AOAM5319Idu3vX1kvbxi1G7XceA9O02UGyPikeGH6WHtR12GmD3OvDde
        m0cnQFfwWIu60e2Bi5P6zW2W2nXfZpEphgmh
X-Google-Smtp-Source: ABdhPJwf4cPrbGMvJZbtWoLqr6V5dll2BxzUzo2RaTzC83d4iAgqrI3HRfGxn3cZ5ZeHT+ZtuVZheA==
X-Received: by 2002:adf:a443:: with SMTP id e3mr28283681wra.115.1633993093076;
        Mon, 11 Oct 2021 15:58:13 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id h8sm9240890wrm.27.2021.10.11.15.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 15:58:12 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] thermal: rcar_gen3_thermal: Read calibration from fuses
Date:   Tue, 12 Oct 2021 00:58:00 +0200
Message-Id: <20211011225802.11497-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Morimoto-san,

This series allows the Gen3 thermal driver to read its calibration
values (THCODE and PTAT) from the fuses, if set. If the values are not
set the driver fall-back to the previously used pseudo values from the
datasheet.

I don't have access to a system where the fuses are set but I have been 
told that you Morimoto-san do have access to one. Would it be possible 
for you to test this series for me?

The test case is a rather straight forward boot test. The patches are 
based on recent changes to the driver but everything is included in 
v5.15-rc4. If you have time to build and boot these patches on top of 
that and just check two things I would be very happy.

1. Check that the driver uses the fused values, this is showed by the 
   log message, dev_info(dev, "Using fused calibration values\n"); is 
   trigged when the driver probe.

2. Check the temperature readings in sysfs are reasonable, the values are 
   in millidegree Celsius. On my system that uses the coefficients from 
   the driver I have 41-42 degrees Celsius at the moment.

   # grep . /sys/class/thermal/thermal_zone*/temp
   /sys/class/thermal/thermal_zone0/temp:41000
   /sys/class/thermal/thermal_zone1/temp:42000
   /sys/class/thermal/thermal_zone2/temp:41000

If these two checks are OK for you I think this patch is ready to be 
consumed. Thanks for your help!

Patch 1/2 prepare for reading the values from fuses by moving the
storage of the values used during calculation from global const to
members of the private data structures. While patch 2/2 populates the
private members with data from the fuses if available.

Niklas Söderlund (2):
  thermal: rcar_gen3_thermal: Store thcode and ptat in priv data
  thermal: rcar_gen3_thermal: Read calibration from hardware

 drivers/thermal/rcar_gen3_thermal.c | 113 +++++++++++++++++++++-------
 1 file changed, 86 insertions(+), 27 deletions(-)

-- 
2.33.0

