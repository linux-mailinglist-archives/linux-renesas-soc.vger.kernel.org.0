Return-Path: <linux-renesas-soc+bounces-32448-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FmOElzRAmoNxgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32448-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 09:06:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DEC51B750
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 09:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 549DA301EC59
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 07:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 547CB37AA9F;
	Tue, 12 May 2026 07:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tpq9cN3m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3599379C51;
	Tue, 12 May 2026 07:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778569519; cv=none; b=Zl0yHmxHMrR0Od6OK4Y4qbfC+MwX45wNEbmke7aFUv7FqDwgD5G39PU159LltZL0aa1dbV9s27tp7hla/pRQGOlCxyp3AYa1C7LNlH/XupcpwLOd/Wdz+ng2VOzOKARbOjBoa7WYX4T0dqIZkFkDE4kef+kNoKQ+nJZ7LYNW6K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778569519; c=relaxed/simple;
	bh=CbKrYA7cN/wwbpVWPG+J7VYnuHQ+Y1RlkMJzpdzjJ2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fm0ICU/uDb/mDzqBDVVQyl3+uTCK13S5reIyISCMGiLdELOnazaSxkudMZvsKbxnwW6ApKBvqMJTgOV9dXmcYnaHjz+oMCuItsnTSmCLo0BUiFFYDAcc86NCdGCzx9ztVpoQFo9wb/Si7U7q+hvbNvQ8JlVXtArEtBTqOO7qSKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tpq9cN3m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69DEAC2BCB0;
	Tue, 12 May 2026 07:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778569519;
	bh=CbKrYA7cN/wwbpVWPG+J7VYnuHQ+Y1RlkMJzpdzjJ2Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tpq9cN3mXo3Rye52s4rApyI+1AFdgTwxtPdB/HYT1MCFvp9a7Jbr14L1eZLUokRl/
	 wCrOlSQWkhqywVOEc9gAmR+PCPDUBQrlCrKoxV8b8cMHGNd0ebuYkQXVHk9PzFW925
	 LF83+eoZKBvwxDoe396PpM1cvF5nuuhqtF/TCtPyRFrWe+NnQP5XifdUPQYsTP1knp
	 mzMXLvEMem5OE0L7yyrk0iwks0k/jEDEU6P4ZMymGGG2FJo1w5kPJ6/3m80TnI3wyZ
	 bpgWWyAyvJXsgIp5NSowbSc3tsxBnvzb9lzAZBfAZamK5+a2wBbHfkSVuBAqtcQLOV
	 HT3Iu/3zoO52g==
Message-ID: <e092cd5d-6a46-4440-9085-95c929e8fb83@kernel.org>
Date: Tue, 12 May 2026 10:05:12 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] PCI: Add pci_host_common_link_train_delay() helper
To: Hans Zhang <18255117159@163.com>, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com,
 pali@kernel.org, ryder.lee@mediatek.com, claudiu.beznea.uj@bp.renesas.com,
 mpillai@cadence.com
Cc: robh@kernel.org, s-vadapalli@ti.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260511055923.37117-1-18255117159@163.com>
 <20260511055923.37117-2-18255117159@163.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20260511055923.37117-2-18255117159@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E1DEC51B750
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[163.com,google.com,kernel.org,ti.com,gmail.com,bootlin.com,mediatek.com,bp.renesas.com,cadence.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32448-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi, Hans,

On 5/11/26 08:59, Hans Zhang wrote:
> PCIe r6.0, sec 6.6.1 (Conventional Reset) requires that for a Downstream
> Port supporting Link speeds greater than 5.0 GT/s, software must wait a
> minimum of 100 ms after Link training completes before sending any
> Configuration Request.
> 
> Introduce a static inline helper pci_host_common_link_train_delay() that
> checks the given max_link_speed (2 = 5.0 GT/s, 3 = 8.0 GT/s, etc.) and
> calls msleep(100) only when the speed is greater than 5.0 GT/s.
> 
> This allows multiple host controller drivers to share the same mandatory
> delay without duplicating the logic.
> 
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
>   drivers/pci/controller/pci-host-common.h | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
> index b5075d4bd7eb..d709f7e3e11a 100644
> --- a/drivers/pci/controller/pci-host-common.h
> +++ b/drivers/pci/controller/pci-host-common.h
> @@ -10,6 +10,9 @@
>   #ifndef _PCI_HOST_COMMON_H
>   #define _PCI_HOST_COMMON_H
>   
> +#include <linux/delay.h>
> +#include "../pci.h"
> +
>   struct pci_ecam_ops;
>   
>   int pci_host_common_probe(struct platform_device *pdev);
> @@ -20,4 +23,18 @@ void pci_host_common_remove(struct platform_device *pdev);
>   
>   struct pci_config_window *pci_host_common_ecam_create(struct device *dev,
>   	struct pci_host_bridge *bridge, const struct pci_ecam_ops *ops);
> +
> +/**
> + * pci_host_common_link_train_delay - Wait 100 ms if link speed > 5 GT/s
> + * @max_link_speed: the maximum link speed (2 = 5.0 GT/s, 3 = 8.0 GT/s, ...)
> + *
> + * Must be called after Link training completes and before the first
> + * Configuration Request is sent.
> + */
> +static inline void pci_host_common_link_train_delay(int max_link_speed)
> +{
> +	if (max_link_speed > 2)
> +		msleep(PCIE_RESET_CONFIG_WAIT_MS);

In case of RZ/G3S driver the max_link_speed is populated based on 
"max-link-speed" DT property (by calling of_pci_get_max_link_speed()). My 
understanding from [1] (and the review of the initial RZ/G3S driver support) is 
that this is not a mandatory property (note also the "Host drivers *could* add 
this" from [1]). At least for the RZ/G3S driver, in case the "max-link-speed" DT 
property is not present in DT but the controller supports more than 5GT/s (that 
is possible as the driver supports more controller variants), the max_link_speed 
argument will be negative. In that case the msleep() will not be called. This 
looks like an opposite of what the patch set is trying to achieve.

Also, if I'm not wrong, there is also the possibility of having the 
max-link-speed > 2 but the downstream port to not support more than 5GT/s. In 
that case the mspeep() would also be executed (but I think that wouldn't be 
really an issue).

Thank you,
Claudiu

[1] 
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/pci/pci-bus-common.yaml#L117

Thank you,
Claudiu


