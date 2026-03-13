Return-Path: <linux-renesas-soc+bounces-29380-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJ/UA9JHtGk4kAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29380-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 18:22:26 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2FB2880A9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 18:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D345302170B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 17:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997C53CBE8C;
	Fri, 13 Mar 2026 17:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="PD+9Xjrw";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="KTVqbxgH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA37B3CBE67;
	Fri, 13 Mar 2026 17:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773422304; cv=none; b=buSbEXSxPD0UpME2Iu1JgSSO4VbrqAnSt+nRabOAwQE/I8KY4UQU5skUgRhbWAtcvieWqVOUbUStw11/XqdlXGCOYa0xMkw2l/JgfLYxAZ9oHdWlXpvtcRW+WwQF4QLeIhDln0hSNPFPDViST1ZhxklvSK0ZiEbTnNtP5ikH0pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773422304; c=relaxed/simple;
	bh=MN+5C6DCkiqEv3AguEnFMw89duy97Bdr3SJFu2qQvfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UqSyKRCBV3Qy2r5+iwjVgBGw4MUENIbcPe54YF8b9JtNrdRtN8YNP6w1OX83DENn8QUil7sNh4BxayW0ziKsQL6oL3EzXKkSr9PPGzaMb95aAEp8bRITDic1qSVXk6xxw+A/PG6tI2uxO0AFwAy35PQQ9cdB2RncULCEgXHFETA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=PD+9Xjrw; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=KTVqbxgH; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fXWR04cnrz9tWs;
	Fri, 13 Mar 2026 18:18:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773422300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fTboTofXKVygm5nRnxwX/miy1TrApwSw+e03gudE3+8=;
	b=PD+9XjrwLwa2eZ6/wYYOr3/DSKoKd+m6IEomqg8yaiHgQ5VzvOTYcweyYmSQu0Dp6If0vB
	oyHqOIJ4aclyCfKtswgaxW/7H8EMtuAaRtqpBJ4R8ywEw5rxEA+XcdS9hdnBc1IJtW0til
	QDat8pNA+31D137KbdDtvTio5ox7bMV+Heo/MK7ZFOMQLDLFhVIKuVOk6ZPQmjj67dM+oU
	ZbJaf4H20jOe4v1XraAcUPi3SKKRpjaufOVTaXtmUflWNGwogrGKe+6lkjfWUGWdDKqMml
	5ZuIrjzLqfku5i7kyaoIruGXzQFilSRztvWqY5mvPGCDPxTdX1PBLnbzMD5jtg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=KTVqbxgH;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <54535d8f-71b7-4ce1-a1fb-747056f368d1@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773422298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fTboTofXKVygm5nRnxwX/miy1TrApwSw+e03gudE3+8=;
	b=KTVqbxgH9//Vpmih6wdTgyzXuQISp55136jRGb1u4oNdOnJVIWwVT/P3yPAGv6u1Uw2m9+
	UNKqpavvmaoaOIqS8GxFIAFkxsxRE6YAm5HJT8lvTmiJzi4W5l7IMtCZvrI9YpclvN/rVo
	uSvw71N4C1nE5EYjaNdOnZaZ9f8kL1uyPpwndPyA33wVGSLH7gs0I5yZqONykiG/LmLRBk
	gKWPC7U/CcF15UxAZZhzMuCAF5K64heVsL/84OzORLuzVe0ae7EE5mYE+1+FLniN4LUatu
	ZL4ztsQKZG3iLX6O+9bRrz2QRfmtCYhgJ75Fu6ReIM2LNoqBY3LJUyNwDu1Vww==
Date: Fri, 13 Mar 2026 18:18:14 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] arm64: dts: renesas: Fix PHY C22 compatible strings
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "magnus.damm" <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
 <TY3PR01MB11346A57519DD3EB5BB4456D38645A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <TY3PR01MB11346A57519DD3EB5BB4456D38645A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: pfh3th3m3uohh86p3bnfbfgfyxreezcd
X-MBO-RS-ID: bb76ffa5bb1c6e3e25a
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,bp.renesas.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-29380-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:dkim,mailbox.org:email,mailbox.org:mid]
X-Rspamd-Queue-Id: 6A2FB2880A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 5:52 PM, Biju Das wrote:
> Hi Marek,
> 
> Thanks for the series.
> 
>> -----Original Message-----
>> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> Sent: 13 March 2026 16:39
>> Subject: [PATCH 0/4] arm64: dts: renesas: Fix PHY C22 compatible strings
>>
>> Realtek RTL8211E/RTL8211F and Microchip KSZ9131 PHY schemas indicate that compatible string "ethernet-
>> phy-id001c.c91[56]"
>> and "ethernet-phy-id0022.1640" must not be followed by any other compatible string. Drop "ethernet-
>> phy-ieee802.3-c22"
>> to match the schemas.
>>
>> The KSZ9131 schema does not document "txdv-skew-psec" property.
>> Fix what is likely a copy-paste error from the "rxdv-skew-psec"
>> property, use "txen-skew-psec" property instead.
>>
>> This is compile-tested and schema validated only. I have discussed this with Biju and they could
>> perform tests on real hardware to assure no breakage. Please wait for their TB before applying.
> 
> 
> Looks like there is delay in delivering my patches. I already posted 3 patches. I will test 4/4.

Hehe, excellent timing here.

> https://patchwork.kernel.org/project/linux-renesas-soc/patch/20260313130623.297712-1-biju.das.jz@bp.renesas.com/
> https://patchwork.kernel.org/project/linux-renesas-soc/patch/20260313130920.298392-1-biju.das.jz@bp.renesas.com/
> https://patchwork.kernel.org/project/linux-renesas-soc/patch/20260313141150.406528-1-biju.das.jz@bp.renesas.com/
Thank you

