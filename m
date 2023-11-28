Return-Path: <linux-renesas-soc+bounces-349-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AC17FBE07
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 16:23:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82803B20AE8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 15:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934B85D497;
	Tue, 28 Nov 2023 15:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F79B1701;
	Tue, 28 Nov 2023 07:23:04 -0800 (PST)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3b84402923fso2751308b6e.0;
        Tue, 28 Nov 2023 07:23:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701184984; x=1701789784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8lrrpwWFs5OE69FmxlNZV6hy765/ETf7P4dl/kidnU=;
        b=RTeg0UiO/hZciB4VALdv5PFKZyxBQxSsOaFU4qfAyHYm8/O2m5g6m4+W/9+kLIPOse
         l9rbwHisWNtSc/ujxQiOJCrabcCys2zos1B3wSu5KkegkWgzZ9r8acxfnsvO8nndlt6l
         /W5BieTawYyaGg+vPdMkcKt21yPRna5N2Vp7OQNKmCmQS6gLQftELqBAs2EXaI2YZwC/
         ICUPkOrxscY9j5bu8z/UHbWgrItuS09jmcYbA2aZgxsssctoURsP7cY6G4fpDlFGXUhM
         ztlvn2ke9uzSxRFyOjLyXt6fQO50ShT19Dr5dpClglNO2MX6SqVIq1n+6ACDyW0ftyDk
         cy2g==
X-Gm-Message-State: AOJu0YyIMH9wBm9JRDU8JkBVavbbp/pAT993Ff6oZhv6HaaTuGvmp/IA
	qnvO8m9sAhiHS4z8eaTzRA==
X-Google-Smtp-Source: AGHT+IGkVAUja/6fjsjPq78kvxJEYyVNZuUdW5L4rCDF3BTk1W3hhlgCIQtiracg+VmBUh9tLUFxEA==
X-Received: by 2002:a05:6808:16a2:b0:3ab:9afd:8efd with SMTP id bb34-20020a05680816a200b003ab9afd8efdmr16856302oib.40.1701184981856;
        Tue, 28 Nov 2023 07:23:01 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s6-20020a056808008600b003a8560a9d34sm1836647oic.25.2023.11.28.07.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 07:23:01 -0800 (PST)
Received: (nullmailer pid 3300509 invoked by uid 1000);
	Tue, 28 Nov 2023 15:23:00 -0000
Date: Tue, 28 Nov 2023 09:23:00 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Aymeric Aillet <aymeric.aillet@iot.bzh>, Yusuke Goda <yusuke.goda.sx@renesas.com>
Subject: Re: [PATCH v2 2/4] of: add __of_get_next_status_child() and makes
 more generic of_get_next
Message-ID: <20231128152300.GA3275878-robh@kernel.org>
References: <87fs0zc14m.wl-kuninori.morimoto.gx@renesas.com>
 <87cyw3c13p.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cyw3c13p.wl-kuninori.morimoto.gx@renesas.com>

On Tue, Nov 21, 2023 at 02:05:30AM +0000, Kuninori Morimoto wrote:
> Linux Kernel has of_get_next_available_child().
> Add more generic __of_get_next_status_child() to enable to use same
> logic for other status.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
> ---
>  drivers/of/base.c | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 3cb467a7e747..d0f7e7c890f1 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -612,16 +612,9 @@ struct device_node *of_get_next_child(const struct device_node *node,
>  }
>  EXPORT_SYMBOL(of_get_next_child);
>  
> -/**
> - * of_get_next_available_child - Find the next available child node
> - * @node:	parent node
> - * @prev:	previous child of the parent node, or NULL to get first
> - *
> - * This function is like of_get_next_child(), except that it
> - * automatically skips any disabled nodes (i.e. status = "disabled").
> - */
> -struct device_node *of_get_next_available_child(const struct device_node *node,
> -	struct device_node *prev)
> +static struct device_node *__of_get_next_status_child(const struct device_node *node,

'__' means the lock should already be held, not that it is an internal 
function.

With that dropped,

Reviewed-by: Rob Herring <robh@kernel.org>

