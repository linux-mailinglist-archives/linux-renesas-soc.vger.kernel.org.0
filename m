Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8275E2025FB
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 20 Jun 2020 20:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728424AbgFTSfV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 20 Jun 2020 14:35:21 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45332 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728408AbgFTSfU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 20 Jun 2020 14:35:20 -0400
Received: by mail-lj1-f194.google.com with SMTP id i27so15010089ljb.12
        for <linux-renesas-soc@vger.kernel.org>; Sat, 20 Jun 2020 11:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZDnWtPHPaOLUtABOCxMTzOdKJ3ttE96ZinRb322rFx0=;
        b=eq6Aj1TWfX62VaSFm8GnPxrXZNN+8/K8sypfOxY1QeqKihH8NJWlgN9A+0TKZN5cnl
         qAWgj9uiqZuOPqOL6DF23YRMMgvmxnqj+4dYT1WDslruTsvDBvfYfT/MmRXPwH6+Wtxw
         2Qd7iK1LroPvJO2/JzDajs5JREYR3E+UXGrTN2vwHqW2sr+2M9op5YurGJgxD+IAFg7Y
         tor1wc3MUUFJjDNjeP+Jq5pBI5quxpbwf4QSff7VDem1n7AmwZyx0k1yQXyTuA8vr7vI
         fvNoLzEOvZfymYFAjzPWX1xFP06AqT2JjzvnCBX3/cAoSvPFsx5Pf/ua9bedWdJb8li1
         tpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ZDnWtPHPaOLUtABOCxMTzOdKJ3ttE96ZinRb322rFx0=;
        b=aQzzq9yePsSIweNEp1XDElHOk2epTqxox7AmwA0m2Js7g5A32EkdGEYrHw6BypRI8e
         DfbtFcVuT01KLkB2cW7TIkdFpTwwoKdrLEFAd3btfWGXzymqNBxVvjJr+BNH9qiFStvY
         YRfxESMsKtS1zMojW0wkrzSfoKcidW4kXU3d7Gjzvlgeked9LdDxfZxQSbyzbSmi79OD
         Glpe1KzK9CIdmpM3YEyrLTsYWxqZ5wKTBqukZUaZqx2c5f5r6RoTOmRKMwAIlB5OjCRy
         YTikWcRfcqN6T+QDxhZPe9Puqbr8O+kpK4zccs0dlalW9h93414IrMMd1xf+zJfo3vW/
         L26A==
X-Gm-Message-State: AOAM533eEgW2o37U4/oKJ3wqssnWEf82HuELR/TsqXOOIgqSJZdACk2p
        weCtCT7fzG0A4x0B1Q66hK6y162OwMo=
X-Google-Smtp-Source: ABdhPJz1js9/2hjpd6079DaMq9b36qjlv/9tLhUqKKYyHRN3m6/2hoCtQItXPNpPodjiLRzzL2hWvA==
X-Received: by 2002:a2e:8346:: with SMTP id l6mr4404144ljh.209.1592678058239;
        Sat, 20 Jun 2020 11:34:18 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:462b:c4af:1cf5:65ea:51a9:9da1])
        by smtp.gmail.com with ESMTPSA id q13sm2218822lfb.55.2020.06.20.11.34.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 20 Jun 2020 11:34:17 -0700 (PDT)
Subject: Re: [PATCH/RFC 2/5] ravb: Split delay handling in parsing and
 applying
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20200619191554.24942-1-geert+renesas@glider.be>
 <20200619191554.24942-3-geert+renesas@glider.be>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <cc7f8090-2713-7b9a-55ad-effd43b7a61b@cogentembedded.com>
Date:   Sat, 20 Jun 2020 21:34:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20200619191554.24942-3-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 06/19/2020 10:15 PM, Geert Uytterhoeven wrote:

> Currently, full delay handling is done in both the probe and resume
> paths.  Split it in two parts, so the resume path doesn't have to redo
> the parsing part over and over again.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

[...]

MBR, Sergei
