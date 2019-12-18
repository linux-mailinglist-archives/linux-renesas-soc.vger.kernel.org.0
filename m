Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04CAB1246CD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2019 13:27:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbfLRM15 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Dec 2019 07:27:57 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39537 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726774AbfLRM15 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Dec 2019 07:27:57 -0500
Received: by mail-lj1-f194.google.com with SMTP id l2so1923583lja.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Dec 2019 04:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+/GGE8/3NVkfYj18053TgeJg9egAYk1bKBYKsUh3cso=;
        b=P7i6gL/7KtPDnAtZpa42UmKP1yny++PGg1kyuITSJ2lQR0L2RhayY9xuBE/UTG/sLd
         boq3gIiJdbeoSIe9K7JPz5x/a+aQWVXtQaLPsHJOJ8pphhpwo+tn5xrgw1X4ee5S3Joh
         T9L0yLHyu/Q0zwMvkWEAwyQ1kgDPrMLSwbPtyXSgaFA5lbJS0AnpfTgIcm9tbHGxcKIV
         i4fBpD5oz+o6O1Dly5N0oZL3zCjysgPp12PD/kSQwuFpmAeflM+7ojt69Gx+LUxTHTRO
         HlGlBvWoJGXpqYC2OZ0A79+5cXCMPlJwCvWIv+TO05n3sQmhwbflGYPQRCy1vLTLdGVB
         6itQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+/GGE8/3NVkfYj18053TgeJg9egAYk1bKBYKsUh3cso=;
        b=i3urpf4rB8vGSS0yUfTreM1gfQnMEgDIt8j48GOeXD0KkaCf9S4M2JDPU8Wveg+gIV
         30xzOloZREatq8EnoqnHkE8LbMNET92Fg78yoqa5bCggekiZzFzBdUXTA/KI8ghmBOCp
         NHLRjrW4wbvsAXsHR67OdNGvXgmJFXanDJsFFbSSSIeL2lb0mkihR2edySYbAESjMya4
         cwiA5ewFpu63UHLINJmB14dqOAZVcz6qd7T8E2LiCXeIqLnmFGRw9T8P3c7qTGxRGxso
         mx4mo5sSfBCBvn4fMwRjcnjvwbmTuFKO3jziN5lKrmnnH3AcQTnfX1Lvi/URtnLqTbCB
         zN7A==
X-Gm-Message-State: APjAAAUbVo8N+I2+lq8BsTHJmwp5keVypkae7gSJvHhwnR7L/Rjy4Wio
        oXBtj16wv4YGer3qVhRa7sdx4xHEX/Q=
X-Google-Smtp-Source: APXvYqzprS2f6hq+LyvlD9owjBNNN5xf/aAqVUPJvcHaNQqx34kFX04QzZLRfxaC3B204fRVzYVNDw==
X-Received: by 2002:a2e:854c:: with SMTP id u12mr1491154ljj.135.1576672074962;
        Wed, 18 Dec 2019 04:27:54 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:48d1:167a:a0eb:a81d:ed95:7846? ([2a00:1fa0:48d1:167a:a0eb:a81d:ed95:7846])
        by smtp.gmail.com with ESMTPSA id g14sm1073933ljj.37.2019.12.18.04.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2019 04:27:53 -0800 (PST)
Subject: Re: [PATCH] clock: renesas: cpg-mssr: Fix the typo
To:     Biju Das <biju.das@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <1576667390-29449-1-git-send-email-biju.das@bp.renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <2368e2c8-7f80-ec22-2c9f-4f719ab347dc@cogentembedded.com>
Date:   Wed, 18 Dec 2019 15:27:52 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <1576667390-29449-1-git-send-email-biju.das@bp.renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 18.12.2019 14:09, Biju Das wrote:

> This patch fixes the typo %s/r8a774a1/r8a774b1/.
> 
> Fixes: 1000393 ("dt-bindings: clock: renesas: cpg-mssr: Document r8a774b1

    SHA1 should have at least 12 digits.

> binding")

    And never break up the tag lines please.

> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
[...]

MBR, Sergei
