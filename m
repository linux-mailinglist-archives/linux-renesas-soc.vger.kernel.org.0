Return-Path: <linux-renesas-soc+bounces-25011-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 556F5C7BA4C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 21:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD3303A6A8C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 20:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D86B2FD7D0;
	Fri, 21 Nov 2025 20:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UgeJeDUi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DE12DE6EE
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 20:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763757301; cv=none; b=D3w2nV7jbv2+8esNtFg3UXprt6s/iupPijZ3ozTmwtOi/bXE6dhIs7UcP33yevIgkXWfVr2+zWnQ2gIZkF5HNipuaglXRrs+R0/PZeH41Cys/LrMqFBSsw8y24XmGbAx7TQmoPjyo44KucAY02IM69WUg+bT/BSPDsEKRlSipeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763757301; c=relaxed/simple;
	bh=M60ppb//H9sKe6m5Tk7i5TJj3kevAng5BF6dEuEy4Vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JnYYOytZSUGX3B6JCFE3Y6jJ/E3UlgKOyabcDUs+0XSdSUEKJCxevEvNtjm3BdPLrTKM42ILmoQ1kS4jj6sIl15EbS5JJt3A4g4qgtqGAgHFYBf7GTxE2LC/U4z6CWNn99gcEQrWhCVG6ZDu9XoQ+1wx6AJKM7kk+A4Kviz///s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UgeJeDUi; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-429c5e0f94eso351328f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 12:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763757298; x=1764362098; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WwhJFqhAczJOO0qU+80wvF/PLKhmQ/1mxT9Dd9zYdEg=;
        b=UgeJeDUitk0vaSoCvzN5QqXt3TY6K6AINSADEqrC4EHY+Xb6gRx+6F4hOnT9Zl6kFh
         L22wuuWhDstL2WEdOMfKXfLoPehG3TtO2fpOGaD201bJ5O5GlvLN7r+S+GZRHyNKNkDF
         rd6NHeLKsEimpARKpWjwna9IIdLJDriTa3tR0LshUGbz4X2A7cG26gln1tuI7sNGtVpF
         DYkD+7w3QjeBfKIZKDZn/Lc4zkG1ETkxdSZoWHlZEaWMBuDEnBrrKjVbkr/EjtfUMdMM
         Zpgj/i5CNeWhoRbYAng80/Yix/jhy6RxvqDqnkCzKsQf1ID429q7m8hsRE1rrL/p7Leg
         +00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763757298; x=1764362098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WwhJFqhAczJOO0qU+80wvF/PLKhmQ/1mxT9Dd9zYdEg=;
        b=C21eVZLKM0/HHHiElK22ui+oi/t2rnPFVhiNQx/qus8EEp6Gwr9HUaCauuhyCavX+u
         iYYAKFp5hXtOlloGuXDfWrc2FayzK8k5wtscy1pFznSRHui+xngUZr4KgQoWV5AGMjBr
         jWzN8/NJcV6RqBJr2NXPyJtqp1zjbv5cQNeCYr2ZAqlaxq3TiEWvrdF8qEaMMUiEA+HJ
         eA9eeJlYgaYnQywOjne5OdMzT9wTCfloI4utWFTut+CFWQPu3wgU8riQ5tpmQyEIaV0z
         PPLRk5QhbNUF+EsW8jur0fKBJmhEOFFyAGNWZXIDoeiVvKLOFa5I/fLrivbhM858zCnz
         qDYA==
X-Forwarded-Encrypted: i=1; AJvYcCUP+Ha5yncuTZ1jciL3hGewC2veQqaxT4M3DoiDidOvb9jsVX+cm8hqiJA/WVBO2BzXj1GZ7t7kbvahVSCrjzpLMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YytoQQTMb06D6dBnCMO6Iw13UzsZ/C98hiuo7K5+uvK3f70c7Lh
	VvW9wn6LaHNFhTc/MBq3rY6/46ltBe6ZbP6ED2y8bf6WFkQiy+Gq1e4e
X-Gm-Gg: ASbGnct3VZL5451SGGCqepk3HCm5H8gxZ9+ot5QhTZ5/J91SMralgQAN8nG8i++5DW+
	zL1A7vPTWmIrTUnIi09xEOe43FIfBHYgqF0CHjmPh9tVQrDLQcmsKLofkVaWG2c97PkiXiGDhGp
	b6zbm4K+2yW/N3WoSEShdccV/mx2SSZ0mQ243/0dtVeRbOWhkO+HqsEYeb4VF+FNFyfoaT4niA0
	FAAKZIVMlEfYp8xuJTwbptfoGDgVGLKYXHDcTsHi3BRP+ArLe7ANMmTL7RSbTB9ceytXw15uAeD
	K3uDj6Gw2i/MOuRb2FNK1iJQNwHgLMYbvW18ON/wczSZlPbefyxvdVzri0waj1TV6y77DKZSayD
	GdD7MDTyfYEAymqCvQyKoXFykwXBoKEuax3GkD9BucABPrTncWZHcBG6dv4MVjVXSC73NH+hr9V
	EJaNA=
X-Google-Smtp-Source: AGHT+IFC8kdcCwISEeqn1/BVSyLrWHWtcX9veaTgK7cMPvTaOlbl4PhGsFkZHRO/ufY6drDUItJW6Q==
X-Received: by 2002:a05:600c:1396:b0:477:a478:3f94 with SMTP id 5b1f17b1804b1-477c316e614mr15812255e9.5.1763757297763;
        Fri, 21 Nov 2025 12:34:57 -0800 (PST)
Received: from skbuf ([2a02:2f04:d106:d600:b19f:2efa:e88a:a382])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf227ae2sm60446565e9.9.2025.11.21.12.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 12:34:56 -0800 (PST)
Date: Fri, 21 Nov 2025 22:34:53 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next 07/11] net: dsa: rzn1-a5psw: Make switch
 topology configurable via OF data
Message-ID: <20251121203453.y6s46k4ttdtq5mgh@skbuf>
References: <20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251121113553.2955854-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251121113553.2955854-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121113553.2955854-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251121113553.2955854-8-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Fri, Nov 21, 2025 at 11:35:33AM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Move the switch topology description-the number of ports and the CPU-port
> index-out of hard-coded constants and into SoC-specific OF match data. The
> driver previously assumed a fixed 5-port layout with the last port acting
> as the CPU port. That assumption does not hold for newer Renesas variants,
> and embedding it in the code made the driver inflexible and error-prone.

That assumption has 2 parts: that the port has 5 ports, and that the
last port is the CPU port. It's unclear from your statement which part
does not hold. I see that for the new switches, the CPU port is still
the last port (not that there's a problem with still parameterizing it).

> 
> Introduce a small a5psw_of_data structure carrying both the total number
> of ports and the CPU-port identifier, and rely on this data everywhere the
> driver previously used fixed values. This ensures that port loops, PCS
> allocation, management-port setup, and bridge bookkeeping all reflect the
> actual hardware configuration.
> 
> Making these attributes runtime-selectable allows the driver to support
> RZ/T2H and RZ/N2H SoCs which use different port counts and CPU-port
> assignments-without rewriting common logic or forking the driver, while
> preserving correct behaviour on existing RZN1 systems.

The code is mostly fine, but reading the commit message had me jumping
or twitching any time I would see the words "configure" or "make attributes
runtime-selectable". These expressions have their own meanings having to
do with adding kernel APIs through which these parameters can be changed
(by the user), so I wasn't really sure what I was going to review. None
of that is the case, according to the code. Please choose other wording.
You're not making the driver attributes configurable, you're just
replacing constants hardcoded in the .text section with constants
hardcoded in structured data in the .rodata section, selected at probe
time based on compatible string.

I'm sorry for saying this, but the commit message is too long for the
amount of information that it transmits. You repeated 3 times the
properties that need to be parameterized (port count and CPU port index),
and there's more bla bla about irrelevant things like forking the driver.

The commit message has to serve as an aid in understanding the change
itself, not detract from it. In this case, giving the motivation and
context in one paragraph or two is fine, but then you can use the space
to focus on listing the transformations that need to be followed when
reviewing the patch, and if not obvious, explain what led to those
choices. What you want is obviously correct changes.

For example, why ARRAY_SIZE(a5psw->pcs) transforms into
a5psw->of_data->nports - 1. Is this the best choice? The code looks
worse, and it's not obvious that the last port would not have a PCS as a
matter of architecture. You had several other options: introduce an
"npcs" extra parameter, or even compare with "cpu_port" and place
comments explaining the lack of a PCS for the CPU port (since "cpu_port"
is "nports - 1").

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/net/dsa/rzn1_a5psw.c | 26 +++++++++++++++++---------
>  drivers/net/dsa/rzn1_a5psw.h | 17 ++++++++++++++---
>  2 files changed, 31 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
> index 99098bc06efe..d957b6d40f05 100644
> --- a/drivers/net/dsa/rzn1_a5psw.c
> +++ b/drivers/net/dsa/rzn1_a5psw.c
> @@ -382,13 +382,14 @@ static void a5psw_port_bridge_leave(struct dsa_switch *ds, int port,
>  				    struct dsa_bridge bridge)
>  {
>  	struct a5psw *a5psw = ds->priv;
> +	unsigned int cpu_port = a5psw->of_data->cpu_port;
>  
>  	a5psw->bridged_ports &= ~BIT(port);
>  
>  	a5psw_port_set_standalone(a5psw, port, true);
>  
>  	/* No more ports bridged */
> -	if (a5psw->bridged_ports == BIT(A5PSW_CPU_PORT))
> +	if (a5psw->bridged_ports == BIT(cpu_port))
>  		a5psw->br_dev = NULL;
>  }
>  
> @@ -924,20 +925,21 @@ static void a5psw_vlan_setup(struct a5psw *a5psw, int port)
>  static int a5psw_setup(struct dsa_switch *ds)
>  {
>  	struct a5psw *a5psw = ds->priv;
> +	unsigned int cpu_port = a5psw->of_data->cpu_port;
>  	int port, vlan, ret;
>  	struct dsa_port *dp;
>  	u32 reg;
>  
> -	/* Validate that there is only 1 CPU port with index A5PSW_CPU_PORT */
> +	/* Validate that there is only 1 CPU port with index matching cpu_port */
>  	dsa_switch_for_each_cpu_port(dp, ds) {
> -		if (dp->index != A5PSW_CPU_PORT) {
> +		if (dp->index != cpu_port) {
>  			dev_err(a5psw->dev, "Invalid CPU port\n");
>  			return -EINVAL;
>  		}
>  	}
>  
>  	/* Configure management port */
> -	reg = A5PSW_CPU_PORT | A5PSW_MGMT_CFG_ENABLE;
> +	reg = cpu_port | A5PSW_MGMT_CFG_ENABLE;
>  	a5psw_reg_writel(a5psw, A5PSW_MGMT_CFG, reg);
>  
>  	/* Set pattern 0 to forward all frame to mgmt port */
> @@ -1147,7 +1149,7 @@ static void a5psw_pcs_free(struct a5psw *a5psw)
>  {
>  	int i;
>  
> -	for (i = 0; i < ARRAY_SIZE(a5psw->pcs); i++) {
> +	for (i = 0; i < a5psw->of_data->nports - 1; i++) {
>  		if (a5psw->pcs[i])
>  			miic_destroy(a5psw->pcs[i]);
>  	}
> @@ -1174,7 +1176,7 @@ static int a5psw_pcs_get(struct a5psw *a5psw)
>  			goto free_pcs;
>  		}
>  
> -		if (reg >= ARRAY_SIZE(a5psw->pcs)) {
> +		if (reg >= a5psw->of_data->nports - 1) {
>  			ret = -ENODEV;
>  			goto free_pcs;
>  		}
> @@ -1223,7 +1225,8 @@ static int a5psw_probe(struct platform_device *pdev)
>  	if (IS_ERR(a5psw->base))
>  		return PTR_ERR(a5psw->base);
>  
> -	a5psw->bridged_ports = BIT(A5PSW_CPU_PORT);
> +	a5psw->of_data = of_device_get_match_data(dev);
> +	a5psw->bridged_ports = BIT(a5psw->of_data->cpu_port);
>  
>  	ret = a5psw_pcs_get(a5psw);
>  	if (ret)
> @@ -1268,7 +1271,7 @@ static int a5psw_probe(struct platform_device *pdev)
>  
>  	ds = &a5psw->ds;
>  	ds->dev = dev;
> -	ds->num_ports = A5PSW_PORTS_NUM;
> +	ds->num_ports = a5psw->of_data->nports;
>  	ds->ops = &a5psw_switch_ops;
>  	ds->phylink_mac_ops = &a5psw_phylink_mac_ops;
>  	ds->priv = a5psw;
> @@ -1310,8 +1313,13 @@ static void a5psw_shutdown(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, NULL);
>  }
>  
> +static const struct a5psw_of_data rzn1_of_data = {
> +	.nports = 5,
> +	.cpu_port = 4,
> +};
> +
>  static const struct of_device_id a5psw_of_mtable[] = {
> -	{ .compatible = "renesas,rzn1-a5psw", },
> +	{ .compatible = "renesas,rzn1-a5psw", .data = &rzn1_of_data },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, a5psw_of_mtable);
> diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
> index 81be30d6c55f..d1b2cc5b43e6 100644
> --- a/drivers/net/dsa/rzn1_a5psw.h
> +++ b/drivers/net/dsa/rzn1_a5psw.h
> @@ -195,8 +195,7 @@
>  #define A5PSW_aCarrierSenseErrors		0x924
>  
>  #define A5PSW_VLAN_TAG(prio, id)	(((prio) << 12) | (id))
> -#define A5PSW_PORTS_NUM			5
> -#define A5PSW_CPU_PORT			(A5PSW_PORTS_NUM - 1)
> +#define A5PSW_MAX_PORTS			4

Poor naming choice - it makes nports larger than A5PSW_MAX_PORTS, which
according to their name should be directly comparable.

Perhaps A5PSW_MAX_NUM_PCS (a comment explaining the relationship with
the CPU port would be good).

>  #define A5PSW_MDIO_DEF_FREQ		2500000
>  #define A5PSW_MDIO_TIMEOUT		100
>  #define A5PSW_JUMBO_LEN			(10 * SZ_1K)
> @@ -231,6 +230,16 @@ union lk_data {
>  	struct fdb_entry entry;
>  };
>  
> +/**
> + * struct a5psw_of_data - OF data structure
> + * @nports: Number of ports in the switch
> + * @cpu_port: CPU port number
> + */
> +struct a5psw_of_data {
> +	unsigned int nports;
> +	unsigned int cpu_port;
> +};
> +
>  /**
>   * struct a5psw - switch struct
>   * @base: Base address of the switch
> @@ -238,6 +247,7 @@ union lk_data {
>   * @clk: clk_switch clock
>   * @ts: Timestamp clock
>   * @dev: Device associated to the switch
> + * @of_data: Pointer to OF data
>   * @mii_bus: MDIO bus struct
>   * @mdio_freq: MDIO bus frequency requested
>   * @pcs: Array of PCS connected to the switch ports (not for the CPU)
> @@ -254,8 +264,9 @@ struct a5psw {
>  	struct clk *clk;
>  	struct clk *ts;
>  	struct device *dev;
> +	const struct a5psw_of_data *of_data;
>  	struct mii_bus	*mii_bus;
> -	struct phylink_pcs *pcs[A5PSW_PORTS_NUM - 1];
> +	struct phylink_pcs *pcs[A5PSW_MAX_PORTS];
>  	struct dsa_switch ds;
>  	struct mutex lk_lock;
>  	spinlock_t reg_lock;
> -- 
> 2.52.0
> 


