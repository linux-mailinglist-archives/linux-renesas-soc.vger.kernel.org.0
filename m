Return-Path: <linux-renesas-soc+bounces-351-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E58477FBE24
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 16:34:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 139101C2048A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 15:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3495E0A4;
	Tue, 28 Nov 2023 15:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6E26D1;
	Tue, 28 Nov 2023 07:34:15 -0800 (PST)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3b85c88710eso2018519b6e.3;
        Tue, 28 Nov 2023 07:34:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701185655; x=1701790455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/s5nzJrgcDgHTEmuKvkZGzXXI/W4rPPv5fulVrFV4o=;
        b=GlzHpU8x5PFHeIZ+tMcpcggtUcRwHrl7YX6oIbSv/KzhBXd6mc0yZ5a5V0oG5HwMw7
         g2sDMlV7sc0cXSav4SrZVkml+DuaUVUGIEHxJTIojOmB5o0X+P6CpIDlGfNVi0CJezZi
         X99j4PvPPqnj3Vq67Upb4Z3mZONCbTtxNDCLPdMVigjRwO/EzHJdbhFloqAkX7JOzQS6
         oD0LlYH/Sk+K6boasoixAWn42PGbErVHbV6YzktSDjXFCMkpgzQ9iArUGI7Uqoe8B3j/
         T0j5wJNh4Tcz67zgremGAKcHI3JDssj56ZjG2c3thnVBWXhNFi3FKnb2XrF2Bit+KD8A
         1fSA==
X-Gm-Message-State: AOJu0YxCG9Clpb1G6hkW5wyGiCG1A70Cmc8yIecnKlqlZYjaj9nvF1aU
	+Nf8YRFUx4PTSFotqo4k0MNXc7uRRA==
X-Google-Smtp-Source: AGHT+IF7fXNt26u5294GTSFxKFMQiYGKeu/ESpbRbCazTn2YRAqixDIUhPyeZLCN5iXYcID3T4WN4A==
X-Received: by 2002:a05:6808:128a:b0:3b8:44cb:414d with SMTP id a10-20020a056808128a00b003b844cb414dmr25575185oiw.25.1701185655190;
        Tue, 28 Nov 2023 07:34:15 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w9-20020a056808140900b003b892a45d32sm8668oiv.4.2023.11.28.07.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 07:34:14 -0800 (PST)
Received: (nullmailer pid 3312619 invoked by uid 1000);
	Tue, 28 Nov 2023 15:34:13 -0000
Date: Tue, 28 Nov 2023 09:34:13 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Aymeric Aillet <aymeric.aillet@iot.bzh>, Yusuke Goda <yusuke.goda.sx@renesas.com>
Subject: Re: [PATCH v2 4/4] drivers: clk: renesas: enable all clocks which is
 assinged to non Linux system
Message-ID: <20231128153413.GA3301324-robh@kernel.org>
References: <87fs0zc14m.wl-kuninori.morimoto.gx@renesas.com>
 <87a5r7c13d.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a5r7c13d.wl-kuninori.morimoto.gx@renesas.com>

On Tue, Nov 21, 2023 at 02:05:42AM +0000, Kuninori Morimoto wrote:
> Some board might use Linux and another OS in the same time. In such
> case, current Linux will stop necessary module clock when booting
> which is not used on Linux side, but is used on another OS side.
> 
> To avoid such situation, renesas-cpg-mssr try to find
> status = "reserved" devices (A), and add CLK_IGNORE_UNUSED flag to its
> <&cgp CPG_MOD xxx> clock (B).
> 
> Table 2.4: Values for status property
> https://github.com/devicetree-org/devicetree-specification/releases/download/v0.4/devicetree-specification-v0.4.pdf
> 
> "reserved"
> 	Indicates that the device is operational, but should not be
> 	used. Typically this is used for devices that are controlled
> 	by another software component, such as platform firmware.
> 
> ex)
> 	scif5: serial@e6f30000 {
> 		...
> (B)		clocks = <&cpg CPG_MOD 202>,
> 			 <&cpg CPG_CORE R8A7795_CLK_S3D1>,
> 			 <&scif_clk>;
> 		...
> (A)		status = "reserved";
> 	};
> 
> Cc: Aymeric Aillet <aymeric.aillet@iot.bzh>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
> ---
>  drivers/clk/renesas/renesas-cpg-mssr.c | 118 +++++++++++++++++++++++--
>  1 file changed, 109 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
> index cb80d1bf6c7c..26098b7f4323 100644
> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -142,6 +142,8 @@ static const u16 srstclr_for_gen4[] = {
>   * @reset_clear_regs:  Pointer to reset clearing registers array
>   * @smstpcr_saved: [].mask: Mask of SMSTPCR[] bits under our control
>   *                 [].val: Saved values of SMSTPCR[]
> + * @reserved_ids: Temporary used, reserved id list
> + * @num_reserved_ids: Temporary used, number of reserved id list
>   * @clks: Array containing all Core and Module Clocks
>   */
>  struct cpg_mssr_priv {
> @@ -168,6 +170,9 @@ struct cpg_mssr_priv {
>  		u32 val;
>  	} smstpcr_saved[ARRAY_SIZE(mstpsr_for_gen4)];
>  
> +	unsigned int *reserved_ids;
> +	unsigned int num_reserved_ids;
> +
>  	struct clk *clks[];
>  };
>  
> @@ -453,6 +458,19 @@ static void __init cpg_mssr_register_mod_clk(const struct mssr_mod_clk *mod,
>  			break;
>  		}
>  
> +	/*
> +	 * Ignore reserved device.
> +	 * see
> +	 *	cpg_mssr_reserved_init()
> +	 */
> +	for (i = 0; i < priv->num_reserved_ids; i++) {
> +		if (id == priv->reserved_ids[i]) {
> +			dev_info(dev, "Ignore Linux non-assigned mod (%s)\n", mod->name);
> +			init.flags |= CLK_IGNORE_UNUSED;
> +			break;
> +		}
> +	}
> +
>  	clk = clk_register(NULL, &clock->hw);
>  	if (IS_ERR(clk))
>  		goto fail;
> @@ -949,6 +967,75 @@ static const struct dev_pm_ops cpg_mssr_pm = {
>  #define DEV_PM_OPS	NULL
>  #endif /* CONFIG_PM_SLEEP && CONFIG_ARM_PSCI_FW */
>  
> +static void __init cpg_mssr_reserved_exit(struct cpg_mssr_priv *priv)
> +{
> +	kfree(priv->reserved_ids);
> +}
> +
> +static int __init cpg_mssr_reserved_init(struct cpg_mssr_priv *priv,
> +					 const struct cpg_mssr_info *info)
> +{
> +	struct device_node *root = of_find_node_by_path("/soc");

'root' is '/', so I find this slightly confusing.

> +	struct device_node *node = NULL;
> +	struct of_phandle_args clkspec;
> +	unsigned int *ids = NULL;
> +	unsigned int num = 0;
> +
> +	/*
> +	 * Because cpg_mssr_info has .num_hw_mod_clks which indicates number of all Module Clocks,
> +	 * and clk_disable_unused() will disable all unused clocks, the device which is assigned to
> +	 * non-Linux system will be disabled when Linux was booted.
> +	 *
> +	 * To avoid such situation, renesas-cpg-mssr assumes the device which has
> +	 * status = "reserved" is assigned to non-Linux system, and add CLK_IGNORE_UNUSED flag
> +	 * to its clocks if it was CPG_MOD.
> +	 * see also
> +	 *	cpg_mssr_register_mod_clk()
> +	 *
> +	 *	scif5: serial@e6f30000 {
> +	 *		...
> +	 * =>		clocks = <&cpg CPG_MOD 202>,
> +	 *			 <&cpg CPG_CORE R8A7795_CLK_S3D1>,
> +	 *			 <&scif_clk>;
> +	 *			 ...
> +	 *		 status = "reserved";
> +	 *	};
> +	 */
> +	for_each_reserved_child_of_node(root, node) {

Don't you really want to find all reserved nodes in the DT rather than
just child nodes of a single node?


> +		unsigned int i = 0;
> +
> +		while (!of_parse_phandle_with_args(node, "clocks", "#clock-cells", i++, &clkspec)) {

of_for_each_phandle()

> +
> +			of_node_put(clkspec.np);
> +
> +			if (clkspec.np == priv->dev->of_node &&
> +			    clkspec.args[0] == CPG_MOD) {
> +
> +				ids = krealloc_array(ids, (num + 1), sizeof(*ids), GFP_KERNEL);
> +				if (!ids)
> +					return -ENOMEM;
> +
> +				ids[num] = info->num_total_core_clks +
> +						MOD_CLK_PACK(clkspec.args[1]);
> +
> +				num++;
> +			}
> +		}
> +	}

