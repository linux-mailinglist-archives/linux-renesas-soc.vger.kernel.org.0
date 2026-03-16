Return-Path: <linux-renesas-soc+bounces-29486-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QImaFOIFuGkWYQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29486-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 14:30:10 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F238829A631
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 14:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C8623012C7A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 13:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A6B397E62;
	Mon, 16 Mar 2026 13:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Wl8JXgAK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010005.outbound.protection.outlook.com [52.101.69.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB8A28BAB9;
	Mon, 16 Mar 2026 13:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773667807; cv=fail; b=WEuvkOKS4rxdvx8F9IR1+8+rGrhj11qlLJeYBAiLkeDRQw9OUR/OAQRMyKkFiVZHWFF/qWHnrFOumG8qy1GMOVoI2REGrwQycJqZCBkKJE/WjXKu+9adQY22+ImpYP26PdvViIAkHD2W2BXFNHkM8ecBq6gUQBZDBiuoCNsdjX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773667807; c=relaxed/simple;
	bh=OgW+3g4ZtwEG3HQy3uBrpDjbmSzRl2c6VsRU6jjfmoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FgZ8KrFEEhNdjETmxfKlLuFwiisZAIDzrNbzPguQbAs95yMi61lOoPXnw1SX0LSw9FbjPhhP/URx/0/rb7BGT4fD7hkF4MhMPjQ9WymEk81DvSp8WURtzsmHQ68Xm/HX4rZLx73J19LU9bsX5WkU2avelWhjC4dEU08fffknhx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Wl8JXgAK; arc=fail smtp.client-ip=52.101.69.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=caRSxI2H1FSt52og450186K7J0hbEvLOCBnRoImqx476oODEGPoR0ictPR5sVptHcRWJ7rXuxNh+gHPWmjhPJa3UiZkCZNQ3Y8TkvvgRtcNkFmu2BwIhgMTYRcy3Kf/92a0Na6Vz5LEGfLIjCq9Ri+B7s9v6G9WjmUgFtHjVnV+2JkXkH0ZyUBmvVJw5H+vhF3pwQmHGSI1YVkpMHJ4sEzqkxfqorsOg2oFQPTGK1H16aA+f46cip7lDscbPFKxV4wTM6Co+ZanU2b/Ry6aJz6Bx6M+gLennpiPM8/7ERiOKiXvTElrGRMuT8pmIEpUOJP+zVZsn+ch7gf+FCduaQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPEC+zuO/pn/G+M5SaOjIZmt9JY9xQeBNzANAeikaWQ=;
 b=uOS+NiuHZkVzGZ2u3uO1iis1UKmm0O1NsAWdgGyRj63WCQySuHa5LPI7aOhlRN+YZQQO+RIQEFRALPMCrKZtT5e3OBvC0ElAAie7FjGQQG2KfoL9qUaigq2Mw+hy4Neh+sDDUanqaqaA0IQZCdTS1huHB93tNFCuwKVPEeBoM6tAXazdRtGSSsVGzAzosYGEddtkoqyX2uyyK+JwQji/mqTX3/T1YL/N5InOl4z7G/gMDJb31ksEO6RzvtyqF5gzjA+rTpkjmAsd+BFxztNoxrTV7tSh3eUEy71nW5M5+unTaxPeAe9xHOkWsP2ZsgOQXKye4Q1q1XI441KvBh+wRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPEC+zuO/pn/G+M5SaOjIZmt9JY9xQeBNzANAeikaWQ=;
 b=Wl8JXgAKnnbMaS+XOvXrYb5Vpe6zZfqRppXeI55Fu0yipzOlaZUyyEGZPUWOgyXXp8Bo0ja+qFCNShvXpm0m37nwabvMKH/lRTmrbJrdGDQlUpjS8D3DBsmxLOQuto4OW7bNxbtZqpsvaDe3QvkATknAjrRZPlVZ619ogM1N5KeRNB9jlLR11eOqLQO0DkImwcfD8b9uMPsS6T5buRVuFVy6EHrX1HN6o0Er5z192D/ZEbPEMLccagjDbdIUZ3Ht97eGrgIQLAlRjE8gXU8KD3Aohp6aJgaleenjcLCUFn+TYrAYWvH5ynHvWSdGA/Beg+zGuXxjYUqy6M2Ie4ErzQ==
Received: from DB9PR01CA0015.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::20) by PRAPR10MB5251.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:291::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 13:29:57 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:1d8:cafe::fe) by DB9PR01CA0015.outlook.office365.com
 (2603:10a6:10:1d8::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Mon,
 16 Mar 2026 13:29:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 13:29:57 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 16 Mar
 2026 14:32:14 +0100
Received: from [10.130.77.120] (10.130.77.120) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 16 Mar
 2026 14:29:54 +0100
Message-ID: <ba3ae9a0-11ba-4000-b2ed-08aeede0dc54@foss.st.com>
Date: Mon, 16 Mar 2026 14:29:54 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/8] PCI: dwc: Advertise dynamic inbound mapping
 support
To: Niklas Cassel <cassel@kernel.org>
CC: Koichiro Den <den@valinux.co.jp>, <jingoohan1@gmail.com>,
	<mani@kernel.org>, <lpieralisi@kernel.org>, <kwilczynski@kernel.org>,
	<robh@kernel.org>, <bhelgaas@google.com>, <Frank.Li@nxp.com>,
	<vigneshr@ti.com>, <s-vadapalli@ti.com>, <hongxing.zhu@nxp.com>,
	<l.stach@pengutronix.de>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
	<kernel@pengutronix.de>, <festevam@gmail.com>, <minghuan.Lian@nxp.com>,
	<mingkai.hu@nxp.com>, <roy.zang@nxp.com>, <jesper.nilsson@axis.com>,
	<heiko@sntech.de>, <srikanth.thokala@intel.com>,
	<marek.vasut+renesas@gmail.com>, <yoshihiro.shimoda.uh@renesas.com>,
	<geert+renesas@glider.be>, <magnus.damm@gmail.com>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<hayashi.kunihiko@socionext.com>, <mhiramat@kernel.org>, <kishon@kernel.org>,
	<jirislaby@kernel.org>, <rongqianfeng@vivo.com>, <18255117159@163.com>,
	<shawn.lin@rock-chips.com>, <nicolas.frattaroli@collabora.com>,
	<linux.amoon@gmail.com>, <vidyas@nvidia.com>, <shuah@kernel.org>,
	<linux-omap@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-arm-kernel@axis.com>, <linux-rockchip@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <linux-tegra@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
References: <20260124145012.2794108-1-den@valinux.co.jp>
 <20260124145012.2794108-4-den@valinux.co.jp>
 <b2b03ebe-9482-4a13-b22f-7b44da096eed@foss.st.com>
 <tkfhaovpmaoodo35attvmbnpukcqgmwyrxmfgiwjy2dga65cgl@hmj4mx2n44ki>
 <5e485218-becf-499b-8a07-d25358504807@foss.st.com> <abf-LKj8V2MpJFEE@ryzen>
Content-Language: en-US
From: Christian Bruel <christian.bruel@foss.st.com>
In-Reply-To: <abf-LKj8V2MpJFEE@ryzen>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F5:EE_|PRAPR10MB5251:EE_
X-MS-Office365-Filtering-Correlation-Id: 53be0679-0954-4526-d233-08de83601dd0
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 w/ld2OerSgnEdqrgQ0RdamQ21qOEylZeCydFipF8mJnZyAVIS7CJvynj4Imj+jErIi3dya6aV0FWrRJuj2UjGLBck7fXBv713rOD/Hxy2L+hBQGVFOm0Hjuh9ZvhFzRSsvi9iPDGR2DR6Xs/lyhQs1dAPtGiLz84/oUTbPj7T2TwJ6Ikpp1/w6xqTpQMeDz6CQ94PSSxFcbP7QuiwsSSZ8FUWMf3a94en8oblHV3RSpAa19s6HUbNfK/I6isGHcgvpYbBNwYiRgFtPoEH1gOfRk85Y+7xf3/tyqY+2Ypz9QVMrQ9N/S1hWMVPKE42TSc3E8FUExABtP6BjWpOE5l6jv0N/xFlaMjbtfCZYlrEh9vPRpksc3x4ZgHUeGVCD0lNiKAmyj+hdrKInnS/I0LgIEEXlcptlP7pwoOgJUhNuhrsoeY0wOWR6n7rix3cT/VhHRUFHUOvI3QzTtkdCfDVUPpn9Rqq1ytswA2/ygyTbIsz0Rbee3KlHyO/p4Iil86T4FxAuQfVoI2DbQdsbo/6OXVXswdaz8SPIJUhyWvt9ymHl+yiELmBJkNUVVvU+PP9+TzSeLzv7fkW6dLmgWcQGiPNKnZ5r94Qq7fCI1B6PVjZLskCCRdwE331Evk7xEvMFd+HjyjUmFZo00lIbFaN/FpXuAlLC+HT5cZbg0X2/7HqnFc3kRc6KTAGV8QZyuGmLWQKDX2w3KvHGpSr2fl1Sqv3tIU/goN6bqV6jp7DkAqc9JZTnEwZH0HFr3BrIO6ghrFxI43KtROnq5IlcrERA==
X-Forefront-Antispam-Report:
 CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 8jXt8t9NF+j+2zWoWJ2RHif/fjiC+LJpZ5mXgstTilWjXM0hjIWwv4Ruf3iDOGqG4386AfahhGwiMjnXI6ZULQOT/TBE1weqINTN+gobmxVs/ZLPxoSWnHKcNX2PihUb8CtWGGh7tMxtmeOYy/c3XTI4G4B/tJb9wzM7XuWF/pqubP4bxSSQKo5LvkH9DOZArMPFXLTUR0lbqEq5/HwLz9HU+fvn6WkTnANc8sr5r6uhHcIXFYYr02qe8oZOtF0+VvDClxax/ZEHPWwOhb+lkSyXRKAPySIx4JebMl2utrKoj6rj2IOXXTf72Knm4JN2q80/Hb4X4qiA9vziJJ2q6gee2+42M10I+Xyqz2/nI/iBycO2Tct3fk+wqf531GAmRLNFMapHAoFbuMjQ98SQUTTnap2lb1dZgXQwsEFWRl0WzznsFYbYHMKTI7nqBbi3
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 13:29:57.2710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53be0679-0954-4526-d233-08de83601dd0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5251
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[valinux.co.jp,gmail.com,kernel.org,google.com,nxp.com,ti.com,pengutronix.de,axis.com,sntech.de,intel.com,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com,vivo.com,163.com,rock-chips.com,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29486-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[55];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.bruel@foss.st.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[foss.st.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: F238829A631
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/16/26 13:57, Niklas Cassel wrote:
> On Mon, Mar 16, 2026 at 01:41:03PM +0100, Christian Bruel wrote:
>> Hi Koichiro,
>>
>>>
>>> If I understood the problem correctly, would something like the patch below
>>> address it? My expectation is that the subrange mapping test would then fail
>>> consistently on platforms that do not have enough free IB iATU regions.
>>>
>>
>> Thank you for your patch. Yes, now the bar subrange tests fail consistently,
>> so that is enough to say this is not a regression.
>>
>> However, I think there was a clear BAR missing somewhere before running the
>> tests in the EPF driver, as the BARs could be reallocated during the other
>> tests. This is not due to the subrange tests, but the EPF test driver
>> supposes a 1:1 BAR/ATU mapping. Now this assumption is broken. I'm wondering
>> if this could be improved to make the subrange tests pass on all platforms
> 
> Normally, you want one inbound iATU per enabled BAR, since you want the host
> to be able to access all the enabled BARs at any time.
> 
> If you are thinking that we should somehow temporarily disable inbound
> address translation for one of the enabled BARs, such that we can do "steal"
> that iATU to test inbound subrange mapping, then I think that is a bad idea.

yes, I was thinking something about restricting the iATU entry lifetime 
during the BAR test duration and restoring after. But OK I agree, not good.

> 
> I think we should just let the test fail. Possibly we could call some API that
> tells us that all inbound iATUs are occupied, and then SKIP instead of FAIL
> the inbound subrange test case.
> 
> If you really want to test/use inbound subrange mapping, even if your SoC has
> a very limited number of inbound iATUs, then I think a better solution is to
> mark one or multiple of your BARs as disabled:
> https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=endpoint&id=33642e9e36dc084e4fc9245a266c9843bc8303b9
> 
> Then you should have at least one more inbound iATU available, and should be
> able to run the inbound subrange test case.

Yes cherry-picking the BAR_DISABLED support, I can now test the subrange 
with Koichiro's fixup.

  ./pci_endpoint_test -t BAR_SUBRANGE_TEST
TAP version 13
1..6
# Starting 6 tests from 6 test cases.
#  RUN           pci_ep_bar.BAR0.BAR_SUBRANGE_TEST ...
#      SKIP      BAR is test register space
#            OK  pci_ep_bar.BAR0.BAR_SUBRANGE_TEST
ok 1 pci_ep_bar.BAR0.BAR_SUBRANGE_TEST # SKIP BAR is test register space
#  RUN           pci_ep_bar.BAR1.BAR_SUBRANGE_TEST ...
#            OK  pci_ep_bar.BAR1.BAR_SUBRANGE_TEST
ok 2 pci_ep_bar.BAR1.BAR_SUBRANGE_TEST
#  RUN           pci_ep_bar.BAR2.BAR_SUBRANGE_TEST ...
#            OK  pci_ep_bar.BAR2.BAR_SUBRANGE_TEST
ok 3 pci_ep_bar.BAR2.BAR_SUBRANGE_TEST
#  RUN           pci_ep_bar.BAR3.BAR_SUBRANGE_TEST ...
#      SKIP      BAR is disabled
#            OK  pci_ep_bar.BAR3.BAR_SUBRANGE_TEST
ok 4 pci_ep_bar.BAR3.BAR_SUBRANGE_TEST # SKIP BAR is disabled
#  RUN           pci_ep_bar.BAR4.BAR_SUBRANGE_TEST ...
#      SKIP      BAR is disabled
#            OK  pci_ep_bar.BAR4.BAR_SUBRANGE_TEST
ok 5 pci_ep_bar.BAR4.BAR_SUBRANGE_TEST # SKIP BAR is disabled
#  RUN           pci_ep_bar.BAR5.BAR_SUBRANGE_TEST ...
#      SKIP      BAR is disabled
#            OK  pci_ep_bar.BAR5.BAR_SUBRANGE_TEST
ok 6 pci_ep_bar.BAR5.BAR_SUBRANGE_TEST # SKIP BAR is disabled
# PASSED: 6 / 6 tests passed.
# 4 skipped test(s) detected. Consider enabling relevant config options 
to improve coverage.
# Totals: pass:2 fail:0 xfail:0 xpass:0 skip:4 error:0

Thank you,

Christian
> 
> 
> Kind regards,
> Niklas


