Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 509DD2C758E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Nov 2020 23:24:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387993AbgK1VtR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 28 Nov 2020 16:49:17 -0500
Received: from mail-ej1-f68.google.com ([209.85.218.68]:38297 "EHLO
        mail-ej1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727070AbgK1R6W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 28 Nov 2020 12:58:22 -0500
Received: by mail-ej1-f68.google.com with SMTP id a16so12329220ejj.5;
        Sat, 28 Nov 2020 09:58:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b3PkWaxGX1Yw85E1ROLgKHpFTieUWrW10D2VLTpUXOk=;
        b=uXAAbLqisv7CUv6C/EsIR3Ub2k/WZNEfhg1oE2wDwIeME4vkiK5emofXFcd5lIFcrK
         kN/z5K5vvwTwJ0YAiHcbtT4HU/iJyTHG9jmxEn0IcLM+TyYKoDJplnVg151G3yKEEnR2
         oOx522qSAkCOMpTHRUwkE0PvGKC8QGegIVsOXw6EbceX+/X3yNMtZSQZOrRqF+/Q2lYK
         5WA5DLr0wihBp3surPbBbAG5PqH2bil4BIeldCY21daXaqwvtZB1LUPDwYHiETA4zxG3
         sTOkiEZU5Pq0OTMboDHStpI5/2L+bjPUtB6oBdKB+aimNmnMJxB6Y36MWG3NMLP4kczn
         4odA==
X-Gm-Message-State: AOAM531GYNQjNcNsu0UDFMqrvuizPS7BvIzRw075KnCqxq+cSaXLWJ5H
        P8k8JLkcjaX164lQ6ZxbuC9frsG01Mk=
X-Google-Smtp-Source: ABdhPJxDN5OZMJGs3CQ0uJdvOaswkMowAP8VqYfiNYAIxczYzNDxr0mhzorM5u8dolxGTT2y0fMYWw==
X-Received: by 2002:a17:906:fcc4:: with SMTP id qx4mr12439380ejb.5.1606563462751;
        Sat, 28 Nov 2020 03:37:42 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id k16sm4140753ejv.93.2020.11.28.03.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 03:37:41 -0800 (PST)
Date:   Sat, 28 Nov 2020 12:37:40 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jiri Kosina <trivial@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        linux-renesas-soc@vger.kernel.org, Pavel Machek <pavel@denx.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v2 4/5] memory: renesas-rpc-if: Make
 rpcif_enable/disable_rpm() as static inline
Message-ID: <20201128113740.GD4761@kozik-lap>
References: <20201126191146.8753-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20201126191146.8753-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201126191146.8753-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Nov 26, 2020 at 07:11:45PM +0000, Lad Prabhakar wrote:
> Define rpcif_enable_rpm() and rpcif_disable_rpm() as static
> inline in the header instead of exporting them.
> 
> Suggested-by: Pavel Machek <pavel@denx.de>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/memory/renesas-rpc-if.c | 13 -------------
>  include/memory/renesas-rpc-if.h | 13 +++++++++++--
>  2 files changed, 11 insertions(+), 15 deletions(-)

Thanks, applied.

Best regards,
Krzysztof

