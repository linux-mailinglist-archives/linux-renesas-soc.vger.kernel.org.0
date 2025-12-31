Return-Path: <linux-renesas-soc+bounces-26226-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFB9CEC241
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Dec 2025 16:07:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF1E7300E79D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Dec 2025 15:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 957FF27467F;
	Wed, 31 Dec 2025 15:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="emNGogjT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB95262FFC;
	Wed, 31 Dec 2025 15:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767193611; cv=none; b=M7dwesJ9Tld67TEuB8wEl1cpeD2evKT7d8ewllI7hRFMR3Vhhii287Iqi6N0rf/zg8Byn6cCoIuzg6gQt+x49AQmLHggOb/YOzz4ge0Pfd+wcbtZWRNRRxu3nvVs723Q4uGZjDKHZ8h9R8WOSHOKMgvoCdDsADhkrUiv+bNwKqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767193611; c=relaxed/simple;
	bh=z4qFJtQ5nVDXCC3vDydvNyOSf+OZUE5pZE7H4R9a8XM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EvbCTpCN304HkvPps28s3UHQxu/PmdOnVzg7HCiMDwWwJ/9Gjt+hQaMzVzz5mO72m0+hWqpLrPEmUnakKDd9OGdUQfWSMF+pDso3Sq3swpCaV9aictebr8gzSA0zF1cQPST5MVFildEmKhxmzQsJpUrke2m6JB6qE8xUAKgEMwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=emNGogjT; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dhCwJ3pmbz9sm2;
	Wed, 31 Dec 2025 16:06:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767193600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=teb0PqHfzrNTac0BsMMbFad31/7Pp5QGiozH/B3yx2s=;
	b=emNGogjT7N7+ws4gtlTC52CQpGzaedsx9D1wlgrBFbI7teiSNVyWTLCq1qo8xTsUCBO/63
	9UF/tspTZrLEq7xSRPRC5kzn9dh1wQvTddAacYiipj7BYQrWFQpHFGefX8SIkHdRohZvFa
	PnVGhQ2aVtTES40XnZHmMBOLW97VtubIp9AQYIzrRFvDt48iYr+THduHN8dmwsVhABlHsZ
	PcA4G484usSOfjYdB86uYfnJGkjSBOPMu015yHItt9WhfBoywn0wli2u+py64Am1NzSsCS
	qHdrbSDtPo157Iv7/fZPqh0cLdYOumdQdz/Iax8glPwUlHiIXlZ/xzUP4Du4Vg==
Message-ID: <fc175a68-84a3-4877-b96a-a3592139f7ca@mailbox.org>
Date: Wed, 31 Dec 2025 16:05:38 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: include/linux/compiler_types.h:597:38: error: call to
 '__compiletime_assert_437' declared with attribute error: FIELD_PREP: value
 too large for the field
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Laight <david.laight.linux@gmail.com>
Cc: kernel test robot <lkp@intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "open list:MEDIA DRIVERS FOR RENESAS - FCP"
 <linux-renesas-soc@vger.kernel.org>
References: <202512051834.bESvhDiG-lkp@intel.com>
 <84f21e62-c167-4b7f-8727-bdca04eede5e@mailbox.org>
 <20251230103058.GE6598@pendragon.ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251230103058.GE6598@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 44p1pwftzc6jkiqwqrq3x7ee46er58xz
X-MBO-RS-ID: 980fcbfc69f13205ae4

On 12/30/25 11:30 AM, Laurent Pinchart wrote:
> On Tue, Dec 30, 2025 at 03:47:17AM +0100, Marek Vasut wrote:
>> On 12/5/25 11:16 AM, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>>> head:   2061f18ad76ecaddf8ed17df81b8611ea88dbddd
>>> commit: 4f716a1db661cfb31502a0a6d7e62c06daf2e603 drm/rcar-du: dsi: Convert register bitfields to GENMASK() macro
>>> date:   5 weeks ago
>>> config: arc-randconfig-001-20251205 (https://download.01.org/0day-ci/archive/20251205/202512051834.bESvhDiG-lkp@intel.com/config)
>>> compiler: arc-linux-gcc (GCC) 8.5.0
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512051834.bESvhDiG-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202512051834.bESvhDiG-lkp@intel.com/
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>      In file included from <command-line>:
>>>      drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c: In function 'rcar_mipi_dsi_startup.isra.4':
>>>>> include/linux/compiler_types.h:597:38: error: call to '__compiletime_assert_437' declared with attribute error: FIELD_PREP: value too large for the field
>>
>> [...]
>>
>>>      rcar_mipi_dsi.c:660:14: note: in expansion of macro 'VCLKSET_DIV_V4H'
>>>         vclkset |= VCLKSET_DIV_V4H(__ffs(setup_info.vclk_divider) - 1);
>>>                    ^~~~~~~~~~~~~~~
>> I don't think this condition can occur.
>>
>> In drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c :
>> - rcar_mipi_dsi_startup() calls rcar_mipi_dsi_parameters_calc() which is
>> the only site that assigns setup_info.vclk_divider this way:
>>
>>    415         switch (dsi->info->model) {
>>    416         case RCAR_DSI_V3U:
>>    417         default:
>>    418                 setup_info->vclk_divider = 1 << ((clk_cfg->vco_cntrl >> 4) & 0x3);
>>    419                 break;
>>    420
>>    421         case RCAR_DSI_V4H:
>>    422                 setup_info->vclk_divider = 1 << (((clk_cfg->vco_cntrl >> 3) & 0x7) + 1);
>>    423                 break;
>>    424         }
>>
>> In case of V3U, vclk_divider is 1 << (0..3) .
>> In case of V4H, vclk_divider is 1 << (1..8) .
>>
>> In drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c :
>> - rcar_mipi_dsi_startup() later contains the offending code:
>>
>>    653         switch (dsi->info->model) {
>>    654         case RCAR_DSI_V3U:
>>    655         default:
>>    656                 vclkset |= VCLKSET_DIV_V3U(__ffs(setup_info.vclk_divider));
>>    657                 break;
>>    658
>>    659         case RCAR_DSI_V4H:
>>    660                 vclkset |= VCLKSET_DIV_V4H(__ffs(setup_info.vclk_divider) - 1);
>>    661                 break;
>>    662         }
>>
>> This does the reverse of the code that assigned the value above, so:
>>
>> In case of V3U, field value is (0..3) .
>> In case of V4H, field value is (0..7) .
>>
>> Finally in drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h :
>>
>> 256 #define VCLKSET_DIV_V3U_MASK            GENMASK_U32(5, 4)
>> 257 #define VCLKSET_DIV_V3U(n)
>> FIELD_PREP(VCLKSET_DIV_V3U_MASK, (n))
>> 258 #define VCLKSET_DIV_V4H_MASK            GENMASK_U32(6, 4)
>> 259 #define VCLKSET_DIV_V4H(n)
>> FIELD_PREP(VCLKSET_DIV_V4H_MASK, (n))
>>
>> The masks fit exactly. For V3U the mask is 2-bit, or V4H the mask is 3-bit .
>>
>> ...
>>
>> I can however rewrite the code in this way, which should also mitigate
>> this warning. Do you think this makes the code any better ?
> 
> The datasheet says that the VCLKSET.DIV field "should be same as the
> CLOCKSET2.vco_cntrl[5:3]". The change below makes this explicit, which
> may not be a bad thing, even if it duplicates the small calculation.
I believe the following rework should address the duplication concern too:

https://lore.kernel.org/dri-devel/20251231145712.60816-1-marek.vasut+renesas@mailbox.org/

