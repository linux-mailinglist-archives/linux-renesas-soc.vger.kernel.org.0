Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66F0141AD12
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Sep 2021 12:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240225AbhI1Khh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Sep 2021 06:37:37 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:58018
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240205AbhI1Khg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 06:37:36 -0400
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4C8C8402FB
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Sep 2021 10:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632825353;
        bh=AJzuKk/vJuyADYn3Tyc95ocSPqoexwLNcmXZAoYOW8U=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=gIxC8uUYYqvKB088dBQ/UXszBnRXQDTazOyrS7MnFQ14icpLby+YIG3F7LXHnH/Kw
         JLGBzeWRhBrZrBZnRVe3UBImx+yBBRmtUau6o/TwWX2R8dhCoryWIq/iPhxtp858Jn
         +dfh6yZ9Xei1gc/bWbpKNtfeywFFYuv9tkBVGyehJkXAJN9/KqGlD/YThX7rClXid7
         yrv20SlOcNS6vz78gRR/fKRLrx/x38e6db2ITtHmTwBmPxnu8+pgaf9mPQmh0OxDCX
         xgO9ZKprYmJxqlqFGbp73jpo4zARIp2+OCQoluySrbHbTd9j0TBVRBlVAwynUdsxsu
         H74U/r4vxmi3g==
Received: by mail-lf1-f71.google.com with SMTP id bp11-20020a056512158b00b003fc7d722819so18928113lfb.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Sep 2021 03:35:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AJzuKk/vJuyADYn3Tyc95ocSPqoexwLNcmXZAoYOW8U=;
        b=zpGVmLYMDzMoePVkFkR9cTbX4ZIoQQyNGvCa4ziVRo19YzrASNiYMcbcwAGClm1f8C
         b4Y6iRXwaze0F/+3Zap1MCYl2hDEbgbq9PpMl4yDlxWY/LQVTOmLRj+vYQ12wUvVxycs
         6ZqmSjOseeCqfx8xpPwWa2FqdXJrKu94VO4cixWtTuVbikGqtGfRFgaM66EgshspiNZq
         fEAgMGJ5FbHafxAK6rlxrJv/hv/6zcfjTrm2minMY8x1Ao5yO0derLfv9VWde82yRA0r
         6cFvUd12z03Vaon8qlZiJjX9Cowpp7Ge3c50jaV9OUqNnEmCExUdP+h0VppUIVb+8y2x
         tBxg==
X-Gm-Message-State: AOAM531N3T9hzVki5nKK1rtT/aiAwVqkHiigu2dJRxW07KKIiA1Ik9pT
        UdqPSDTLcRJmJM/+kf2xJckIC1SMHBinaY/1pG/Ng0ge0AQdVfzNKWw4MsU4z0YYhG+y3hMCzsi
        8OHveyksXN0+wGYBVNTjd6Z7SyVSp7FxHKaPh1X+LhEBncF1Y
X-Received: by 2002:a2e:4802:: with SMTP id v2mr5077374lja.501.1632825352665;
        Tue, 28 Sep 2021 03:35:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNA8WgVR2+8ER4/6MC54ucH82pwm2S/NMyaoL7vkvgrzQsMxv0gV4MfGvqmFBtf4FYGPJbbA==
X-Received: by 2002:a2e:4802:: with SMTP id v2mr5077357lja.501.1632825352420;
        Tue, 28 Sep 2021 03:35:52 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id l6sm1809230lfp.143.2021.09.28.03.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 03:35:51 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-renesas-soc@vger.kernel.org,
        Duc Nguyen <duc.nguyen.ub@renesas.com>
Subject: Re: [RFC PATCH] memory: renesas-rpc-if: Correct QSPI data transfer in Manual mode
Date:   Tue, 28 Sep 2021 12:35:48 +0200
Message-Id: <163282533892.34438.1878675609177525004.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210922091007.5516-1-wsa+renesas@sang-engineering.com>
References: <20210922091007.5516-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 22 Sep 2021 11:10:06 +0200, Wolfram Sang wrote:
> This patch fixes 2 problems:
> [1] The output warning logs and data loss when performing
> mount/umount then remount the device with jffs2 format.
> [2] The access width of SMWDR[0:1]/SMRDR[0:1] register is wrong.
> 
> This is the sample warning logs when performing mount/umount then
> remount the device with jffs2 format:
> jffs2: jffs2_scan_inode_node(): CRC failed on node at 0x031c51d4:
> Read 0x00034e00, calculated 0xadb272a7
> 
> [...]

Applied, thanks!

[1/1] memory: renesas-rpc-if: Correct QSPI data transfer in Manual mode
      commit: fff53a551db50f5edecaa0b29a64056ab8d2bbca

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
