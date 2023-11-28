Return-Path: <linux-renesas-soc+bounces-350-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D017C7FBE08
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 16:23:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D6361C20A69
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 15:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23C15D4A5;
	Tue, 28 Nov 2023 15:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D7FD49;
	Tue, 28 Nov 2023 07:23:20 -0800 (PST)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-58d54fd8c5aso1599602eaf.2;
        Tue, 28 Nov 2023 07:23:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701184999; x=1701789799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vyin4O7SMmlsbg6TNgijVkv/HV532Xzg7IhlWI2HYWM=;
        b=VEqTeeg3R6t4MHauXa5S7P+nhxMjKCEECrIbh12Y7S7UmN764ffXXXWWFELzHdhTxM
         UXVm64Orb7zPdgxSgwufG2ZOJQjuOG+2GidzhxeMEpHiOG7L68fZw/DfNlyA+CCnenvW
         3xKLMpwsKglt36rq/EpBfutFbJx1fsdkSyEPbu1Tr/Rib7oZZCj9BFpw4d5po9dYhRs9
         KYJt6en1by1gRgs6HqVePnjZG10yt/7njMUaQSSv6ReXEDFqTx6V71/0+8vGy1rTetW0
         hr03VJzBWkFD2uBGYmMBnQQyUGGv//9SeqdmIfx7EzCFfBQxM9v/aAwtSyn82Oc2Bnsq
         RaUg==
X-Gm-Message-State: AOJu0YzwwfNXQIc7cjQzj4C73Tbr5ozEeUNXl0tJYwtrJYSFFXknL9sr
	1OfdW+tFNJFKz54WhmDce1cguHkhJA==
X-Google-Smtp-Source: AGHT+IGekfZ5crGtF2xh+mxah9ZgYprDR+EUz/S/G5eYxlroPZmNKL9ZZHMHKAH43J8JhN+eqsTNZw==
X-Received: by 2002:a05:6820:827:b0:58d:97ac:7030 with SMTP id bg39-20020a056820082700b0058d97ac7030mr6726697oob.5.1701184999355;
        Tue, 28 Nov 2023 07:23:19 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q4-20020a4aac44000000b0057e88d4f8aesm1875952oon.27.2023.11.28.07.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 07:23:18 -0800 (PST)
Received: (nullmailer pid 3301080 invoked by uid 1000);
	Tue, 28 Nov 2023 15:23:17 -0000
Date: Tue, 28 Nov 2023 09:23:17 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Aymeric Aillet <aymeric.aillet@iot.bzh>, Yusuke Goda <yusuke.goda.sx@renesas.com>, Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2 1/4] of: add __of_device_is_status() and makes more
 generic status check
Message-ID: <170118499716.3301021.3927126597135457081.robh@kernel.org>
References: <87fs0zc14m.wl-kuninori.morimoto.gx@renesas.com>
 <87edgjc13v.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87edgjc13v.wl-kuninori.morimoto.gx@renesas.com>


On Tue, 21 Nov 2023 02:05:25 +0000, Kuninori Morimoto wrote:
> Linux Kernel has __of_device_is_available() / __of_device_is_fail(),
> these are checking if the status was "okay" / "ok" / "fail" / "fail-".
> 
> Add more generic __of_device_is_status() function for these.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
> ---
>  drivers/of/base.c | 57 ++++++++++++++++++++++++++++++-----------------
>  1 file changed, 36 insertions(+), 21 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


