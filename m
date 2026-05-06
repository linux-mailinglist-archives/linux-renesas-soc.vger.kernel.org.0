Return-Path: <linux-renesas-soc+bounces-32159-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NOfB8Bo+2miawMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32159-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:13:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 710734DDEDD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:13:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7D8E300EF43
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 16:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1054657E1;
	Wed,  6 May 2026 16:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="hbRddbGv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CCD3E3C5C;
	Wed,  6 May 2026 16:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778083979; cv=none; b=PliIB/Eg3kE5XjAMgu12OtwqAnkB9ZRNU9+IFr7S69GvhQukbsygs/aBSjLZTVNQQRPL8BSxNqYl8eFaf3WqCy5p5UR7NM+c0feO7xYvKxk9LngvJJP01r835dB5XYHdxX47zghqARtMGQONacla9z1vVtuw90QfJxyNLvtnWOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778083979; c=relaxed/simple;
	bh=lbipQSdW9eamAUsOM+N+POd/NzpUUKVeffLPOodwSEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rUhiVijKV8QaOZlm1dOJ9CAklJFTr1DoDyrArtFnlbWwE9Dlax3Th9YUg2MRj1KJgzIoPoYB/8XjfyWE8ZZxQ8/2pnUn27phLbIVlu4/pwAx6ndl71SeU+gJgSgayVloAjpSZx3ipj4+EGPp81+sarTToHOSc3c7fBGj1aJJ5VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=hbRddbGv; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=6Yn1siduxQdPynqGnjuL/BLupMMq5Muv+EwIc3BEU5A=;
	b=hbRddbGvHTc9parUytwp2o919Xf/aPaJwOvV+9zOFYnPwWaoqIsiZhxCMTI3ag
	loWpxGBClFczyjHQ3iPlfHtflcuTWbsbkv+aH1Vn1WftmtkEhnQQXyCESE2DJEtw
	/nJ/nu6FyaCpMzJz0Bh+yHcW6W29ao8f1c1mvYPdxVelg=
Received: from [IPV6:240e:b8f:927e:5900:dbee:26f0:1b68:48a4] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgD3PwAqaPtpQDXyCQ--.172S2;
	Thu, 07 May 2026 00:11:26 +0800 (CST)
Message-ID: <53e37127-975b-42cd-a1a2-35dd3018c45c@163.com>
Date: Thu, 7 May 2026 00:11:22 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] PCI: j721e: Set max_link_speed to enable 100 ms
 delay after link up
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com,
 pali@kernel.org, ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
 claudiu.beznea.uj@bp.renesas.com, mpillai@cadence.com, robh@kernel.org,
 s-vadapalli@ti.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260506152346.166056-1-18255117159@163.com>
 <20260506152346.166056-5-18255117159@163.com>
 <rlsvpbo4gcix3mmbfsxvmfebnnn4bqm3cv34x4qkxuv3zwydnm@ehi3el63z664>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <rlsvpbo4gcix3mmbfsxvmfebnnn4bqm3cv34x4qkxuv3zwydnm@ehi3el63z664>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgD3PwAqaPtpQDXyCQ--.172S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF1xJr1xAFWxKw15XryxKrg_yoW8ZF4rpa
	y7JFWfCF1IqFWY9Fs7Z3W5ZFyaq3Z8J3yUJrZag3W7uFnxCFs3JFyIqFyrJ393KF4kZr12
	yF13tasrWFsxtFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UMrWwUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxA5+Imn7aC5W2gAA3O
X-Rspamd-Queue-Id: 710734DDEDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32159-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[163.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[google.com,kernel.org,ti.com,gmail.com,bootlin.com,mediatek.com,bp.renesas.com,cadence.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[163.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]



On 5/7/26 00:04, Manivannan Sadhasivam wrote:
> On Wed, May 06, 2026 at 11:23:42PM +0800, Hans Zhang wrote:
>> Set cdns_pcie.max_link_speed to the maximum supported link speed
>> (obtained from the device tree property "max-link-speed") in
>> j721e_pcie_set_link_speed(). This activates the post-link delay logic
>> added in cdns_pcie_host_start_link() when the controller supports
>> speeds greater than 5 GT/s.
>>
>> As required by PCIe r6.0 sec 6.6.1, and following the same approach as
>> commit 80dc18a0cba8d ("PCI: dwc: Ensure that dw_pcie_wait_for_link()
>> waits 100 ms after link up"), this ensures a 100 ms delay after link
>> training completes before any Configuration Request is sent.
>>
>> Signed-off-by: Hans Zhang <18255117159@163.com>
>> ---
>>   drivers/pci/controller/cadence/pci-j721e.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
>> index bfdfe98d5aba..ee85b8e04f5b 100644
>> --- a/drivers/pci/controller/cadence/pci-j721e.c
>> +++ b/drivers/pci/controller/cadence/pci-j721e.c
>> @@ -206,6 +206,7 @@ static int j721e_pcie_set_link_speed(struct j721e_pcie *pcie,
>>   	    (pcie_get_link_speed(link_speed) == PCI_SPEED_UNKNOWN))
>>   		link_speed = 2;
>>   
>> +	pcie->cdns_pcie.max_link_speed = link_speed;
> 
> What about other glue drivers?

Hi Mani,

pci-sky1.c:
There is no time to handle the corresponding DTS yet, and the attribute 
"max-link-speed" has not been parsed either. There will be a plan for 
the subsequent upstream.

pcie-sg2042.c：
I'm not familiar with this product.


Do you mean something like a dwc driver, similar to being placed in the 
file drivers/pci/controller/dwc/pcie-designware.c?
pci->max_link_speed = of_pci_get_max_link_speed(np);

For the Cadence driver, it is located in 
drivers/pci/controller/cadence/pcie-cadence-host-common.c.


Best regards,
Hans

> 
> - Mani
> 


