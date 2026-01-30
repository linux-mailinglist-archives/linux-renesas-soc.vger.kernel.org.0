Return-Path: <linux-renesas-soc+bounces-27683-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONs8LU+4fGm7OQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27683-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 14:55:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5628ABB645
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 14:55:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26222300A8E5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 13:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5914030F54A;
	Fri, 30 Jan 2026 13:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TOm78JgU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A5A2F618D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 13:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769781322; cv=none; b=YMdh0RkGAJz93bbAG9op5IocnDGzO8/42UYGZyArQp2r3jqdaO/UaHgfhOwbDkPN5xiDWLda4JX1cgUJ5t52fSvZwS4BHxLcdD6EKbwJoYglVh22STybvi6RKvY41aLLBtlOD2UamoDunAUgUZXAli7ipDw2djZYUZz+b5e9yUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769781322; c=relaxed/simple;
	bh=C9BDDyHTAxvvlBSkzUj3MdBMQ9OfMDISBhPe/MWkWxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hgh4khCKRaRRRhzimU/B50SXy/30hAp6AR3pJIkxLHk7jnL+dUH/H3UtUJ6lxNj7mm5D62Pipy0Kdhb8rMpw1t0LYbeb+ElCGcyVqHVue78E6Tmpirk/Y0YoZok8VBZ2sZ8XrGn31t1u77ab4q9FebZGGXrlWx3VKU7B+jy1948=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TOm78JgU; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-435a11957f6so1811177f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 05:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769781319; x=1770386119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o1Le8LCyLcGQuvZ7tGgECGPbUrm2rSjnSYYZfcbP/cQ=;
        b=TOm78JgU1E3f/w5li/ysvA5/fGI0TGwsv8zw7aKdxRebMpCuNLsbzjP1AQGrSJIo5l
         cc+s3iImV57rIazU8r6cFmWaeXVrQVdWnv/EC8yJYALS2v6qeO7tIjCsu/Y1+CExw+yX
         Fy+/0WpHpq5H0eMyZrFCmyyAAOoaUDRBHBqMZ2xBvHbQvslETgiFCrIrdX3gVCIqYw4j
         /F7yOC07usXS5FMtp6BedJvS04xkBkdxO7gocv/apoBkXRsvh8c+quL1lA46WgfHYcfg
         K5MG9IpGS9ILZYzKsWwrzxxIOt8Df2tKSD/P12ksxZt06vv0nhgHAMnADwtoYWdyn2hs
         iv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769781319; x=1770386119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o1Le8LCyLcGQuvZ7tGgECGPbUrm2rSjnSYYZfcbP/cQ=;
        b=mRYPg95C6WM9cQIppB/SzbXfarLy1xj1Oiqt2r7I5WC6mf1s7XdJW3MuHYj+CllthK
         pIjTIqYTE91b32C3dczIqGFXOePz8MvsjnZJusUTbXfRuvxvs6rxoRxq5ufcFAZqg/nX
         JnNWBgzsmSasOESg5ICtw7ws+6QKZfQn/CxbNQaOo4+UonShrPbyw75BaMkXI0raVLuu
         ZSkjBcIio2NMT/zzwnkFr/StFBBzTF69HT5GqrBhpCXz0pGbcyM9j3OdNm5x8p/ovvVK
         BSVXDIQ//z72T9H3aBDwRXFm4LlYik2TJG1XhXJxAH5wyvOwiVhaQ3Kx5Nu9L6vlyjlD
         nptA==
X-Forwarded-Encrypted: i=1; AJvYcCXb5j09ZZtCsT49slop0imB7Zd35kFuMULvxdbziJi7f/JEsM/RHD6s1+QDwMV5f59VHXK+ajSXBVGqdOsJQIUlTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwK1qlbrvDFLH3NZkb/DCmq3GnP8xE4myLXWCIi7UjSJJh8fLkS
	cFVDg55e+BWzvyzxMgar74to2nWb6rIs3QAvMgwU+BKPVXxEV+BSgwFpPSfEMyQiVIs=
X-Gm-Gg: AZuq6aJFUQ8rGfGEIP6FseFRlSLkZsoomdVK+gV7t7NXJc4Q+ZntG9pEL3YV90B889d
	Z3kbz3ChRXO4p86BMvGYjQatbIvGr1HcNGDa21ef9oZvFwOcnXrFNrgn4QjDFOduNKTl8GD786f
	mJ5SgLsLseI6YY500eEp5BIjXwZKjuqhjIfs0LNVMq2FUfpTara/fkGQ8mF4o4bIdIBvS0tUfFY
	TcTPVZtuM0J6JpOtZZYJeDvwS777N6qQRgd0K4sxRYpi5kJxg1B2vIcjjNShMT08yqDvQOZQFac
	Gw6NAqj8VtvnkFDuu9XpBC2jWkEmZ97uByf/QjcmtDY9O1rCXPrd37c1wUJFgOD1wzIU7Xva08g
	rFS5qFaT2V7IyUyBoZPLoYFu5d7grzfWQh+JxbuODARzwzV0KGFLX5Ru/tPNq5vm8vxtMkZK7ov
	FujASZyLw0rq4AU7tgcR8hcptrzAuL
X-Received: by 2002:a05:6000:40c9:b0:431:35a:4a8f with SMTP id ffacd0b85a97d-435f3aaf7d9mr4567020f8f.47.1769781318602;
        Fri, 30 Jan 2026 05:55:18 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e46cesm22505217f8f.7.2026.01.30.05.55.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 05:55:17 -0800 (PST)
Message-ID: <e53b50e2-72dc-47c3-be52-cefa593dd30a@tuxon.dev>
Date: Fri, 30 Jan 2026 15:55:16 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/15] PCI: rzg3s-host: Explicitly set class code for
 RZ/G3E compatibility
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260129214130.16067-1-john.madieu.xa@bp.renesas.com>
 <20260129214130.16067-11-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260129214130.16067-11-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-27683-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tuxon.dev:mid,tuxon.dev:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 5628ABB645
X-Rspamd-Action: no action

Hi, John,

On 1/29/26 23:41, John Madieu wrote:
> Program the class code register explicitly during PCIe configuration
> initialization. RZ/G3E requires this register to be set, while RZ/G3S
> has these values as hardware defaults.
> 
> This configuration is harmless for RZ/G3S where these match the hardware
> defaults, and necessary for RZ/G3E to properly identify the device as a
> PCI bridge.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> 
> Changes:
> 
> v4: No changes
> v3: No changes
> v2: No changes
> 
>   drivers/pci/controller/pcie-rzg3s-host.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
> index 15ccd9095a3e..76f6d940ba45 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -1054,6 +1054,7 @@ static int rzg3s_pcie_set_max_link_speed(struct rzg3s_pcie_host *host)
>   static int rzg3s_pcie_config_init(struct rzg3s_pcie_host *host)
>   {
>   	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(host);
> +	u32 mask = GENMASK(31, 8);
>   	struct resource_entry *ft;
>   	struct resource *bus;
>   	u8 subordinate_bus;
> @@ -1077,6 +1078,13 @@ static int rzg3s_pcie_config_init(struct rzg3s_pcie_host *host)
>   	writel_relaxed(0xffffffff, host->pcie + RZG3S_PCI_CFG_BARMSK00L);
>   	writel_relaxed(0xffffffff, host->pcie + RZG3S_PCI_CFG_BARMSK00U);
>   
> +	/*
> +	 * Explicitly program class code. RZ/G3E requires this configuration.
> +	 * Harmless for RZ/G3S where this matches the hardware default.
> +	 */
> +	rzg3s_pcie_update_bits(host->pcie, PCI_CLASS_REVISION, mask,
> +			       FIELD_PREP(mask, PCI_CLASS_BRIDGE_PCI_NORMAL));

According to kernel test robot report on v1 this throws a compilation warning:

https://lore.kernel.org/all/202601152104.pV9uMS76-lkp@intel.com/

> +
>   	/* Disable access control to the CFGU */
>   	writel_relaxed(0, host->axi + RZG3S_PCI_PERM);
>   


