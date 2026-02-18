Return-Path: <linux-renesas-soc+bounces-28301-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGwwFSqKlWnqSAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28301-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Feb 2026 10:45:14 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB8B154D38
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Feb 2026 10:45:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 53D98300443D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Feb 2026 09:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51CA33D6FE;
	Wed, 18 Feb 2026 09:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="O10WuU5K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A347833D504
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Feb 2026 09:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771407905; cv=none; b=gIoapq+Dd1dNJ88Vxs7gG6o/lWVwo4teuvp5cOrvUr62+F69XBAEkiUXhwXmuxj64V94s0K77UeTZ4HqmfGzv3aMo7sqtLD11mYjc43QyNe8idtBhsSctIRpEgdUv5kWVGiKIU7kCSB33LNVv4e325sxG1NrZwvI3hI+GMJxSIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771407905; c=relaxed/simple;
	bh=CL9soAKZWnSZZkdKPe8QbrfJgbx6ptDGhfh7XJANNiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nja8JLd05mYisxIOM5PwxJWi0fgC8HlQmJ0YpbMs91KnVR4vmYiqZV+M/qHIdotrFd9su3YmR+WtiETOn8YYSO0w61Hux8JowjHml5itgKfp5VI8LwLno9snlGPv16UDpdFfp8q1zF2LYu0Cg3ZmYNqvlTltwluz7OoMNQGSaPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=O10WuU5K; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48371bb515eso58570985e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Feb 2026 01:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1771407901; x=1772012701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hSgaH5qN66tTg9I9+UItJTauIg80NYLcXtWxdyYbWoQ=;
        b=O10WuU5KbCw5KB108YKVwVaWMKCoKqVu6h4NJZavl9oaP6uw1fPpohFzvaIsCFEsZP
         cN1vu1kduYwW8foGaMk39VSIlxmItn2a6OrESUYKneYDpJGmK0fkBuJZAruNjglU2x/C
         R71Q75019mZ62hThPr7O8+9zQD17u/IUdMkwXfg5xVb9jW3YiTuHZXd4qT+MvDS+lLWt
         aN3bPBmfdmKDazKNIDyX7WnQdWVOq3uHW2fz+iQHZdjGoiIDm5UzzdMZeAX1hTnHpobd
         mL1lf/BKgLMZZAokyk5d6pQm7w1lawF4oMP1mh+0/P6HrshWYY6s6xAY4CPVEj8MHbPK
         U5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771407901; x=1772012701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hSgaH5qN66tTg9I9+UItJTauIg80NYLcXtWxdyYbWoQ=;
        b=oWjdw5+ImfbgHVFLQOuqtiVb5kbp/GOP9HAPHBvR23qk15I9xdfhdhAHv3Kf3MBbPH
         vGtdNSWhY5ILztGQN3Ul1jXuHYOqDLCNlOoSoReyIYSUrf8V5OIrLcKZ+RSXpV7tNAsx
         Yb1WWoS8u1rdkQmGgn3ham+Jot9723H/WqRqdAdshe1yhAZmhRlWc+maf7Rd7MW5bThD
         dA8PdF9/fDHioKrYCqazU+2r7KynsBwj0k0kLId6CrHUJstGSCDJeOzZL8cXHbZKVpmU
         Nqk4NgvvSBGWO0D2/XsCgOq11idXKUmxUpyZyKiaPBbechdhaAGI+RM2Hs8IEXJHvPG3
         WmfA==
X-Forwarded-Encrypted: i=1; AJvYcCU6fI/W8BBbfGkYcO9gOyJbVlT0AxogCFV+Aw/JFHW8Jp2S8yVJ7eXUkO5daZ/D8kuw2m79aXItiJiP1Dtzw/J+dA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+Z9tgOzGCfH0a7+PR/2c9lYqwktmqND5X35vVZz1cyp/xlksd
	z4o0ePqHn1L0G9VU14thWYhn6PQUxHYCcRtCd4dTAQk+NqIp0wkW0Wamwl2Dbpr2NtM=
X-Gm-Gg: AZuq6aIfSMVpo4RN+c9M87nvjw/1l34mPr4XlQfYfNfZDQXqCCopLJWb6PU8JfbFLFE
	QDtLQNOk5N+Gl+jDYhs70ZDL0E0g2PzYyccLNFV67VIFcBqBx+S5s7aDGLZ2BUHh/YHWcT0ZnWx
	qZPpdEKvo9xDRTkEpP2uZp3MJ7Db8pTafW/lvvlkYAcdkqYxp2k0m22L1kCQLMLY6GraI/JD5lw
	vPVuG50v0BfOYgaGNx5sjt8ardZI4kzjwQrVmVsTJhMvwIh9VU+Qb6bpCjNViigipGIWUaqd/AI
	jlHfBxSSH1B6fcaD8VFhI6xbvRYaC4QwwzTjo45tt7VgtglLcwwB6DTh60TG1gQVdFJZopgfXJN
	/9aqOvnHdO59gzt8uF9nm3MCFuE5uoMWiiwKjGJZ54Qe32pRzgqkmYi79MrCXakMuxrburQkKuJ
	Trf/dgHiXColLGun9D0cdnDuN0j55Oyw==
X-Received: by 2002:a05:600c:458a:b0:477:5c58:3d42 with SMTP id 5b1f17b1804b1-48398a7e1e2mr23585475e9.10.1771407900211;
        Wed, 18 Feb 2026 01:45:00 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d78cfsm835667815e9.1.2026.02.18.01.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 01:44:59 -0800 (PST)
Message-ID: <d09e741a-8ad2-4386-9c88-98694fbcf644@tuxon.dev>
Date: Wed, 18 Feb 2026 11:44:57 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/16] PCI: rzg3s-host: Add support for RZ/G3E PCIe
 controller
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260210113041.138430-1-john.madieu.xa@bp.renesas.com>
 <20260210113041.138430-14-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260210113041.138430-14-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28301-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,tuxon.dev:mid,tuxon.dev:dkim,renesas.com:email]
X-Rspamd-Queue-Id: 8CB8B154D38
X-Rspamd-Action: no action

Hi, John,

On 2/10/26 13:30, John Madieu wrote:
> Add support for the PCIe controller found in RZ/G3E SoCs to the existing
> RZ/G3S PCIe host driver. The RZ/G3E PCIe controller is similar to the
> RZ/G3S's, with the following key differences:
> 
>   - Supports PCIe Gen3 (8.0 GT/s) link speeds alongside Gen2 (5.0 GT/s)
>   - Uses a different reset control mechanism via AXI registers instead
>     of the Linux reset framework
>   - Requires specific SYSC configuration for link state control and
>     Root Complex mode selection
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> 
> Changes:
> 
> v5:
>   - Introduce rzg3s_sysc_config() helper for sys configuration
> 
> v4: No changes
> v3: No changes
> v2: Collected tag.
> 
>   drivers/pci/controller/pcie-rzg3s-host.c | 152 ++++++++++++++++++++---
>   1 file changed, 137 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
> index 22858a876fd8..77313cc01c02 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -111,6 +111,16 @@
>   #define RZG3S_PCI_PERM_CFG_HWINIT_EN		BIT(2)
>   #define RZG3S_PCI_PERM_PIPE_PHY_REG_EN		BIT(1)
>   
> +/* RZ/G3E specific registers */
> +#define RZG3E_PCI_RESET				0x310
> +#define RZG3E_PCI_RESET_RST_OUT_B		BIT(6)
> +#define RZG3E_PCI_RESET_RST_PS_B		BIT(5)
> +#define RZG3E_PCI_RESET_RST_LOAD_B		BIT(4)
> +#define RZG3E_PCI_RESET_RST_CFG_B		BIT(3)
> +#define RZG3E_PCI_RESET_RST_RSM_B		BIT(2)
> +#define RZG3E_PCI_RESET_RST_GP_B		BIT(1)
> +#define RZG3E_PCI_RESET_RST_B			BIT(0)
> +
>   #define RZG3S_PCI_MSIRE(id)			(0x600 + (id) * 0x10)
>   #define RZG3S_PCI_MSIRE_ENA			BIT(0)
>   
> @@ -183,9 +193,13 @@ struct rzg3s_sysc_function {
>   /**
>    * struct rzg3s_sysc_info - RZ/G3S System Controller function info
>    * @rst_rsm_b: Reset RSM_B function descriptor
> + * @l1_allow: L1 power state management function descriptor
> + * @mode: Mode configuration function descriptor
>    */
>   struct rzg3s_sysc_info {
>   	struct rzg3s_sysc_function rst_rsm_b;
> +	struct rzg3s_sysc_function l1_allow;
> +	struct rzg3s_sysc_function mode;
>   };
>   
>   /**
> @@ -1124,6 +1138,49 @@ static int rzg3s_config_deinit(struct rzg3s_pcie_host *host)
>   					 host->cfg_resets);
>   }
>   
> +/* RZ/G3E SoC-specific config implementations */
> +static void rzg3e_pcie_config_pre_init(struct rzg3s_pcie_host *host)
> +{
> +	/*
> +	 * De-assert LOAD_B and CFG_B during configuration phase.
> +	 * These are part of the RZ/G3E reset register, not reset framework.
> +	 * Other reset bits remain asserted until config_post_init.
> +	 */
> +	rzg3s_pcie_update_bits(host->axi, RZG3E_PCI_RESET,
> +			       RZG3E_PCI_RESET_RST_LOAD_B | RZG3E_PCI_RESET_RST_CFG_B,
> +			       RZG3E_PCI_RESET_RST_LOAD_B | RZG3E_PCI_RESET_RST_CFG_B);
> +}
> +
> +static int rzg3e_config_deinit(struct rzg3s_pcie_host *host)
> +{
> +	writel_relaxed(0, host->axi + RZG3E_PCI_RESET);
> +	return 0;
> +}
> +
> +static int rzg3e_config_post_init(struct rzg3s_pcie_host *host)
> +{
> +	/* De-assert PS_B, GP_B, RST_B */
> +	rzg3s_pcie_update_bits(host->axi, RZG3E_PCI_RESET,
> +			       RZG3E_PCI_RESET_RST_PS_B | RZG3E_PCI_RESET_RST_GP_B |
> +			       RZG3E_PCI_RESET_RST_B,
> +			       RZG3E_PCI_RESET_RST_PS_B | RZG3E_PCI_RESET_RST_GP_B |
> +			       RZG3E_PCI_RESET_RST_B);
> +
> +	/*
> +	 * According to the RZ/G3E HW manual (Rev.1.15, Table 6.6-130
> +	 * Initialization Procedure (RC)), hardware requires >= 500us delay
> +	 * before final reset deassert.
> +	 */
> +	fsleep(500);
> +
> +	/* De-assert OUT_B and RSM_B to complete reset sequence */
> +	rzg3s_pcie_update_bits(host->axi, RZG3E_PCI_RESET,
> +			       RZG3E_PCI_RESET_RST_OUT_B | RZG3E_PCI_RESET_RST_RSM_B,
> +			       RZG3E_PCI_RESET_RST_OUT_B | RZG3E_PCI_RESET_RST_RSM_B);
> +
> +	return 0;
> +}
> +
>   static void rzg3s_pcie_irq_init(struct rzg3s_pcie_host *host)
>   {
>   	/*
> @@ -1266,6 +1323,47 @@ static int rzg3s_pcie_host_init_port(struct rzg3s_pcie_host *host)
>   	return ret;
>   }
>   
> +/**
> + * rzg3s_sysc_config - Configure SYSC registers for PCIe
> + * @sysc: SYSC descriptor
> + * @mode: Mode value to set (-1 to skip)
> + * @rsm_b: RST_RSM_B value to set (-1 to skip)
> + * @l1_allow: L1_ALLOW value to set (-1 to skip)
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int rzg3s_sysc_config(struct rzg3s_sysc *sysc, int mode, int rsm_b,
> +			     int l1_allow)
> +{
> +	const struct rzg3s_sysc_info *info = sysc->info;
> +	int ret;
> +
> +	if (mode >= 0 && info->mode.mask) {
> +		ret = regmap_write(sysc->regmap, info->mode.offset,
> +				   field_prep(info->mode.mask, mode));

Can't we use regmap_update_bits() here as well to have everything using the same 
pattern?

> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (rsm_b >= 0 && info->rst_rsm_b.mask) {
> +		ret = regmap_update_bits(sysc->regmap, info->rst_rsm_b.offset,
> +					 info->rst_rsm_b.mask,
> +					 field_prep(info->rst_rsm_b.mask, rsm_b));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (l1_allow >= 0 && info->l1_allow.mask) {
> +		ret = regmap_update_bits(sysc->regmap, info->l1_allow.offset,
> +					 info->l1_allow.mask,
> +					 field_prep(info->l1_allow.mask, l1_allow));
> +		if (ret)
> +			return ret;
> +	}

Seeing how this function looks like, I think the overall code (and this 
function) would be simpler if instead of describing functions in
struct rzg3s_sysc_info as individual struct members, would use an array of 
functions. This is how this function will looks like in the end:

static int rzg3s_sysc_config_func(struct rzg3s_sysc *sysc,
				  enum rzg3s_sysc_func_id fid,
				  u32 val)
{
	const struct rzg3s_sysc_info *info = sysc->info;
	const struct rzg3s_sysc_function *functions = info->functions;

	if (fid >= RZG3S_SYSC_FUNC_ID_MAX)
		return -EINVAL;

	if (!functions[fid].mask)
		return 0;

	return regmap_update_bits(sysc->regmap, functions[fid].offset,
				  functions[fid].mask,
				  field_prep(functions[fid].mask, val));
}

The following diff could be applied on top of this series to give you a clue:

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c 
b/drivers/pci/controller/pcie-rzg3s-host.c
index 639b2d781d66..fc61ac02a4ea 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -190,16 +190,26 @@ struct rzg3s_sysc_function {
         u32 mask;
  };

+/**
+ * enum rzg3s_sysc_func_id - System controller function IDs
+ * @RZG3S_SYSC_FUNC_ID_RST_RSM_B: RST_RSM_B SYSC function ID
+ * @RZG3S_SYSC_FUNC_ID_L1_ALLOW: L1 allow SYSC function ID
+ * @RZG3S_SYSC_FUNC_ID_MODE: Mode SYSC function ID
+ * @RZG3S_SYSC_FUNC_ID_MAX: Max SYSC function ID
+ */
+enum rzg3s_sysc_func_id {
+       RZG3S_SYSC_FUNC_ID_RST_RSM_B,
+       RZG3S_SYSC_FUNC_ID_L1_ALLOW,
+       RZG3S_SYSC_FUNC_ID_MODE,
+       RZG3S_SYSC_FUNC_ID_MAX,
+};
+
  /**
   * struct rzg3s_sysc_info - RZ/G3S System Controller function info
- * @rst_rsm_b: Reset RSM_B function descriptor
- * @l1_allow: L1 power state management function descriptor
- * @mode: Mode configuration function descriptor
+ * @functions: SYSC function descriptors array
   */
  struct rzg3s_sysc_info {
-       struct rzg3s_sysc_function rst_rsm_b;
-       struct rzg3s_sysc_function l1_allow;
-       struct rzg3s_sysc_function mode;
+       const struct rzg3s_sysc_function functions[RZG3S_SYSC_FUNC_ID_MAX];
  };

  /**
@@ -1324,45 +1334,22 @@ static int rzg3s_pcie_host_init_port(struct 
rzg3s_pcie_host *host)
         return ret;
  }

-/**
- * rzg3s_sysc_config - Configure SYSC registers for PCIe
- * @sysc: SYSC descriptor
- * @mode: Mode value to set (-1 to skip)
- * @rsm_b: RST_RSM_B value to set (-1 to skip)
- * @l1_allow: L1_ALLOW value to set (-1 to skip)
- *
- * Return: 0 on success, negative error code on failure
- */
-static int rzg3s_sysc_config(struct rzg3s_sysc *sysc, int mode, int rsm_b,
-                            int l1_allow)
+static int rzg3s_sysc_config_func(struct rzg3s_sysc *sysc,
+                                 enum rzg3s_sysc_func_id fid,
+                                 u32 val)
  {
         const struct rzg3s_sysc_info *info = sysc->info;
-       int ret;
-
-       if (mode >= 0 && info->mode.mask) {
-               ret = regmap_write(sysc->regmap, info->mode.offset,
-                                  field_prep(info->mode.mask, mode));
-               if (ret)
-                       return ret;
-       }
+       const struct rzg3s_sysc_function *functions = info->functions;

-       if (rsm_b >= 0 && info->rst_rsm_b.mask) {
-               ret = regmap_update_bits(sysc->regmap, info->rst_rsm_b.offset,
-                                        info->rst_rsm_b.mask,
-                                        field_prep(info->rst_rsm_b.mask, rsm_b));
-               if (ret)
-                       return ret;
-       }
+       if (fid >= RZG3S_SYSC_FUNC_ID_MAX)
+               return -EINVAL;

-       if (l1_allow >= 0 && info->l1_allow.mask) {
-               ret = regmap_update_bits(sysc->regmap, info->l1_allow.offset,
-                                        info->l1_allow.mask,
-                                        field_prep(info->l1_allow.mask, l1_allow));
-               if (ret)
-                       return ret;
-       }
+       if (!functions[fid].mask)
+               return 0;

-       return 0;
+       return regmap_update_bits(sysc->regmap, functions[fid].offset,
+                                 functions[fid].mask,
+                                 field_prep(functions[fid].mask, val));
  }

  static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host)
@@ -1384,7 +1371,8 @@ static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host)
                 goto config_deinit;

         /* Enable ASPM L1 transition for SoCs that use it */
-       ret = rzg3s_sysc_config(host->sysc, -1, -1, 1);
+       ret = rzg3s_sysc_config_func(host->sysc,
+                                    RZG3S_SYSC_FUNC_ID_L1_ALLOW, 1);
         if (ret)
                 goto config_deinit;

@@ -1735,12 +1723,13 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
                 goto port_refclk_put;
         }

-       /*
-        * Put controller in RC (Root Complex) mode for SoCs that
-        * support it. These can operate in either EP or RC mode.
-        * While at it, do also de-assert RST_RSM_B.
-        */
-       ret = rzg3s_sysc_config(sysc, 1, 1, -1);
+       /* Put controller in RC (Root Complex) mode. */
+       ret = rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_RST_RSM_B, 1);
+       if (ret)
+               goto port_refclk_put;
+
+       /* De-assert RST_RSM_B. */
+       ret = rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_MODE, 1);
         if (ret)
                 goto port_refclk_put;

@@ -1792,7 +1781,7 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
          * SYSC RST_RSM_B signal need to be asserted before turning off the
          * power to the PHY.
          */
-       rzg3s_sysc_config(sysc, -1, 0, -1);
+       rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_RST_RSM_B, 0);
  port_refclk_put:
         clk_put(host->port.refclk);

@@ -1823,7 +1812,7 @@ static int rzg3s_pcie_suspend_noirq(struct device *dev)
         if (ret)
                 goto config_reinit;

-       ret = rzg3s_sysc_config(sysc, -1, 0, -1);
+       ret = rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_RST_RSM_B, 0);
         if (ret)
                 goto power_resets_restore;

@@ -1848,7 +1837,11 @@ static int rzg3s_pcie_resume_noirq(struct device *dev)
         struct rzg3s_sysc *sysc = host->sysc;
         int ret;

-       ret = rzg3s_sysc_config(sysc, 1, 1, -1);
+       ret = rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_MODE, 1);
+       if (ret)
+               return ret;
+
+       ret = rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_RST_RSM_B, 1);
         if (ret)
                 return ret;

@@ -1877,7 +1870,7 @@ static int rzg3s_pcie_resume_noirq(struct device *dev)
         reset_control_bulk_assert(data->num_power_resets,
                                   host->power_resets);
  assert_rst_rsm_b:
-       rzg3s_sysc_config(sysc, -1, 0, -1);
+       rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_RST_RSM_B, 0);
         return ret;
  }

@@ -1903,9 +1896,11 @@ static const struct rzg3s_pcie_soc_data rzg3s_soc_data = {
         .config_deinit = rzg3s_config_deinit,
         .init_phy = rzg3s_soc_pcie_init_phy,
         .sysc_info = {
-               .rst_rsm_b = {
-                       .offset = 0xd74,
-                       .mask = BIT(0),
+               .functions = {
+                       [RZG3S_SYSC_FUNC_ID_RST_RSM_B] = {
+                               .offset = 0xd74,
+                               .mask = BIT(0),
+                       },
                 },
         },
  };
@@ -1919,13 +1914,15 @@ static const struct rzg3s_pcie_soc_data rzg3e_soc_data = {
         .config_post_init = rzg3e_config_post_init,
         .config_deinit = rzg3e_config_deinit,
         .sysc_info = {
-               .l1_allow = {
-                       .offset = 0x1020,
-                       .mask = BIT(0),
-               },
-               .mode = {
-                       .offset = 0x1024,
-                       .mask = BIT(0),
+               .functions = {
+                       [RZG3S_SYSC_FUNC_ID_L1_ALLOW] = {
+                               .offset = 0x1020,
+                               .mask = BIT(0),
+                       },
+                       [RZG3S_SYSC_FUNC_ID_MODE] = {
+                               .offset = 0x1024,
+                               .mask = BIT(0),
+                       },
                 },
         },
  };

To have this implemented, patch 07/16 "PCI: rzg3s-host: Make SYSC register 
offsets SoC-specific" would have to be update with enum rzg3s_sysc_func_id, 
rzg3s_sysc_config_func() should be introduced and used there.

With that addressed, this patch will have to only introduce SYSC function IDs 
for L1 allow and mode and set it accordingly though rzg3s_sysc_config_func().

That would, in the end, drop the usage of -1 as argument for rzg3s_sysc_config() 
which is a bit ugly.

Sorry for not spotting this earlier.

Thank you,
Claudiu

> +
> +	return 0;
> +}
> +
>   static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host)
>   {
>   	u32 val;
> @@ -1284,6 +1382,11 @@ static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host)
>   	if (ret)
>   		goto config_deinit;
>   
> +	/* Enable ASPM L1 transition for SoCs that use it */

"Enable ASPM L1 transitions should be enough". But if using the above proposed 
code, the function ID macro would be meaningful enough and thus, I don't 
consider a comment would be needed anymore.

> +	ret = rzg3s_sysc_config(host->sysc, -1, -1, 1);
> +	if (ret)
> +		goto config_deinit;
> +
>   	/* Initialize the interrupts */
>   	rzg3s_pcie_irq_init(host);
>   
> @@ -1631,9 +1734,12 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
>   		goto port_refclk_put;
>   	}
>   
> -	ret = regmap_update_bits(sysc->regmap, sysc->info->rst_rsm_b.offset,
> -				 sysc->info->rst_rsm_b.mask,
> -				 field_prep(sysc->info->rst_rsm_b.mask, 1));
> +	/*
> +	 * Put controller in RC (Root Complex) mode for SoCs that
> +	 * support it. These can operate in either EP or RC mode.
> +	 * While at it, do also de-assert RST_RSM_B.
> +	 */

This should be enough here:

/* Put controller in RC mode and de-assert RST_RSM_B. */

Thank you,
Claudiu

> +	ret = rzg3s_sysc_config(sysc, 1, 1, -1);
>   	if (ret)
>   		goto port_refclk_put;
>   
> @@ -1685,9 +1791,7 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
>   	 * SYSC RST_RSM_B signal need to be asserted before turning off the
>   	 * power to the PHY.
>   	 */
> -	regmap_update_bits(sysc->regmap, sysc->info->rst_rsm_b.offset,
> -			   sysc->info->rst_rsm_b.mask,
> -			   field_prep(sysc->info->rst_rsm_b.mask, 0));
> +	rzg3s_sysc_config(sysc, -1, 0, -1);
>   port_refclk_put:
>   	clk_put(host->port.refclk);
>   
> @@ -1718,9 +1822,7 @@ static int rzg3s_pcie_suspend_noirq(struct device *dev)
>   	if (ret)
>   		goto config_reinit;
>   
> -	ret = regmap_update_bits(sysc->regmap, sysc->info->rst_rsm_b.offset,
> -				 sysc->info->rst_rsm_b.mask,
> -				 field_prep(sysc->info->rst_rsm_b.mask, 0));
> +	ret = rzg3s_sysc_config(sysc, -1, 0, -1);
>   	if (ret)
>   		goto power_resets_restore;
>   
> @@ -1745,9 +1847,7 @@ static int rzg3s_pcie_resume_noirq(struct device *dev)
>   	struct rzg3s_sysc *sysc = host->sysc;
>   	int ret;
>   
> -	ret = regmap_update_bits(sysc->regmap, sysc->info->rst_rsm_b.offset,
> -				 sysc->info->rst_rsm_b.mask,
> -				 field_prep(sysc->info->rst_rsm_b.mask, 1));
> +	ret = rzg3s_sysc_config(sysc, 1, 1, -1);
>   	if (ret)
>   		return ret;
>   
> @@ -1776,9 +1876,7 @@ static int rzg3s_pcie_resume_noirq(struct device *dev)
>   	reset_control_bulk_assert(data->num_power_resets,
>   				  host->power_resets);
>   assert_rst_rsm_b:
> -	regmap_update_bits(sysc->regmap, sysc->info->rst_rsm_b.offset,
> -			   sysc->info->rst_rsm_b.mask,
> -			   field_prep(sysc->info->rst_rsm_b.mask, 0));
> +	rzg3s_sysc_config(sysc, -1, 0, -1);
>   	return ret;
>   }
>   
> @@ -1811,11 +1909,35 @@ static const struct rzg3s_pcie_soc_data rzg3s_soc_data = {
>   	},
>   };
>   
> +static const char * const rzg3e_soc_power_resets[] = { "aresetn" };
> +
> +static const struct rzg3s_pcie_soc_data rzg3e_soc_data = {
> +	.power_resets = rzg3e_soc_power_resets,
> +	.num_power_resets = ARRAY_SIZE(rzg3e_soc_power_resets),
> +	.config_pre_init = rzg3e_pcie_config_pre_init,
> +	.config_post_init = rzg3e_config_post_init,
> +	.config_deinit = rzg3e_config_deinit,
> +	.sysc_info = {
> +		.l1_allow = {
> +			.offset = 0x1020,
> +			.mask = BIT(0),
> +		},
> +		.mode = {
> +			.offset = 0x1024,
> +			.mask = BIT(0),
> +		},
> +	},
> +};
> +
>   static const struct of_device_id rzg3s_pcie_of_match[] = {
>   	{
>   		.compatible = "renesas,r9a08g045-pcie",
>   		.data = &rzg3s_soc_data,
>   	},
> +	{
> +		.compatible = "renesas,r9a09g047-pcie",
> +		.data = &rzg3e_soc_data,
> +	},
>   	{}
>   };
>   


