Return-Path: <linux-renesas-soc+bounces-32162-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WB6uF/5r+2miawMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32162-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:27:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB5B4DE17B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:27:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EBAF03003815
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 16:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F733F0744;
	Wed,  6 May 2026 16:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="gYAMi3Lf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B923ED107;
	Wed,  6 May 2026 16:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778084291; cv=none; b=ujDUdfSmtF97g6qmruD6U81zVlA3q7dYTt2A0LrSQjTKSzTUUCL6R05UQhOZaHkJeh3IIZoz9feNgQXLZzjbGOMwgKtQj+vFLgX/F2h/eUDMVnntRXUwMkqg9SzTHdldItW+fulyIOTplGLvER8JwpQhwtK7iEilTIWOxm2BW50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778084291; c=relaxed/simple;
	bh=3L4R6FdEZBLiS5CBWCBh9qu6D0U+039DKkHyosIiyXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bx6Z/9BUr/A0STwbcDIbmJrMWwsJHELCyxxVEzhX8rPMnRf6QIfJGJ4NvCsYBn6QZymkwhG6USmjptKY8OK/VWP5MDT46HTuDZ00FHKFOdDKTTYEg4Y6VAoDjn1HMbjAE/aheo8SrTh4FoEtnYrMayzlzG0xHQgGq6HjDadDH6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=gYAMi3Lf; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=MYNkE5RiNNntbiGIE16X7Ew1NsSOD35A4toWoL44TXo=;
	b=gYAMi3Lf8HE9qlJdRGnWVPmm+EaDf0Ln/YZF5qFyffTiA+gD6h9VfKYBAOXxXn
	Docp4vrg+axGk+h/WsUjDoJ7HGUap6GLvWFSbdj+duBRXfzxafRPeMdZOGCmYshA
	q/sm1mQPeA00IYcGJ1zxSLNiiOzNdTlz1VfJG4l+xyvqY=
Received: from [IPV6:240e:b8f:927e:5900:dbee:26f0:1b68:48a4] (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBXJO14aftp0jLqCg--.226S2;
	Thu, 07 May 2026 00:16:58 +0800 (CST)
Message-ID: <a74306a3-ad87-424b-aa27-f078523ee1ce@163.com>
Date: Thu, 7 May 2026 00:16:56 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] PCI: Add pcie_wait_after_link_train() helper
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
 "mani@kernel.org" <mani@kernel.org>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "pali@kernel.org" <pali@kernel.org>,
 "ryder.lee@mediatek.com" <ryder.lee@mediatek.com>,
 "jianjun.wang@mediatek.com" <jianjun.wang@mediatek.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 "mpillai@cadence.com" <mpillai@cadence.com>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "s-vadapalli@ti.com" <s-vadapalli@ti.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260506152346.166056-1-18255117159@163.com>
 <20260506152346.166056-2-18255117159@163.com>
 <TY3PR01MB1134694C0F3D14E4A69EFB8CA863F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <TY3PR01MB1134694C0F3D14E4A69EFB8CA863F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:PygvCgBXJO14aftp0jLqCg--.226S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrW3Cw4rAr47ZFyfZF4rGrg_yoW8Zw43pF
	Z5GF1YkF48XFW3Wan3Ja43uFyYgFs3tFy7CryxG348CF9xur13KF4Fg3y3Wr92qrs8Zr12
	yw15t3W7CFWYyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UIQ6XUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7BvRdWn7aXspgAAA36
X-Rspamd-Queue-Id: 4EB5B4DE17B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32162-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[163.com];
	FREEMAIL_TO(0.00)[bp.renesas.com,google.com,kernel.org,ti.com,gmail.com,bootlin.com,mediatek.com,cadence.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]



On 5/6/26 23:34, Biju Das wrote:
> 
> 
>> -----Original Message-----
>> From: Hans Zhang <18255117159@163.com>
>> Sent: 06 May 2026 16:24
>> Subject: [PATCH v2 1/8] PCI: Add pcie_wait_after_link_train() helper
>>
>> PCIe r6.0, sec 6.6.1 (Conventional Reset) requires that for a Downstream Port supporting Link speeds
>> greater than 5.0 GT/s, software must wait a minimum of 100 ms after Link training completes before
>> sending any Configuration Request.
>>
>> Introduce a static inline helper pcie_wait_after_link_train() that checks the given max_link_speed (2 =
>> 5.0 GT/s, 3 = 8.0 GT/s, etc.) and calls
>> msleep(100) only when the speed is greater than 5.0 GT/s. The helper uses the existing
>> PCIE_RESET_CONFIG_WAIT_MS macro defined in pci.h.
>>
>> This allows multiple host controller drivers to share the same mandatory delay without duplicating the
>> logic.
>>
>> Signed-off-by: Hans Zhang <18255117159@163.com>
>> ---
>>   drivers/pci/pci.h | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h index 4a14f88e543a..a8705a2a2d85 100644
>> --- a/drivers/pci/pci.h
>> +++ b/drivers/pci/pci.h
>> @@ -60,6 +60,19 @@ struct pcie_tlp_log;
>>    */
>>   #define PCIE_RESET_CONFIG_WAIT_MS	100
>>
>> +/**
>> + * pcie_wait_after_link_train - Wait 100 ms if link speed > 5 GT/s
>> + * @max_link_speed: the maximum link speed (2 = 5.0 GT/s, 3 = 8.0 GT/s,
>> +...)
>> + *
>> + * Must be called after Link training completes and before the first
>> + * Configuration Request is sent.
>> + */
>> +static inline void pcie_wait_after_link_train(int max_link_speed) {
>> +	if (max_link_speed > 2)
>> +		msleep(PCIE_RESET_CONFIG_WAIT_MS);
>> +}
> 
> Maybe move this patch to the user??

Hi Biju,

Just as Mani's reply stated, I am more inclined to place it in the 
common header file.

Best regards,
Hans

> 
> Cheers,
> Biju
> 
>> +
>>   /* Parameters for the waiting for link up routine */
>>   #define PCIE_LINK_WAIT_MAX_RETRIES	10
>>   #define PCIE_LINK_WAIT_SLEEP_MS		90
>> --
>> 2.34.1
>>


