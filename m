Return-Path: <linux-renesas-soc+bounces-32496-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIFtHulKA2pq3AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32496-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 17:44:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E2A523EB4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 17:44:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EB2B313D893
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 14:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05888368971;
	Tue, 12 May 2026 14:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IHbfPHG/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011015.outbound.protection.outlook.com [52.101.57.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F81835B644;
	Tue, 12 May 2026 14:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778597635; cv=fail; b=O/Mt89lAdUpFtD84XUhzZnWkOanKymGnLzIrKxfKEkzzWtFGAKn539Okb4UPbCSSNnpEndeoBpJZzeGpry6QSEIosdL1vygQcJmhdj4BzFaAnLm2TpvUmOKkldzNQHdNaCw2NSmlslijzEp5fHLM+h7BpQULzJWcbCdqgATu5TE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778597635; c=relaxed/simple;
	bh=ED7dmqZaBAmIOXVPxoE9ndNcVENFIuXeJ/pxd7W/IvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VD3XYZ+o1d2Ci4T+sKcIeVJVLBg7eUSspdj6KhgWErMeNn+5VerUarivwAeKQt9EtWpPQ160BwI4OERrOmIbL3pwSigMtAh1eZbrir7vLJw2SD4FgiOwdVv3AyuF+3/cId0ifcTGIXLhGNdQCn8DBruCZW+QhV7z7OU8iyqj/6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IHbfPHG/; arc=fail smtp.client-ip=52.101.57.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZ6+ja7eu33zwPIPURlYkYHrK3wO1pMoNzuQSE648/ZJvcCLlyU8vAy/tbfNSI0bPYAR93AMcVcol9bjk6XodN4Ulx2M32ET17QAVyv/HMEhPs+WYjmjB9qiPN++EL7z1ue2y9tijtbWhk2Chy9EK2h6a1BIIFn16rVByZIBTlWFsTCGK9D/n16J/48i0RMKPolawDIst6WdpUeS9P6sPTS3sZF5EZTbWbiB0j0qttfVqNDrmutX+gH0QfUf7knYsChg041+vlEXC/y+uLHdgxAESdG0qVq9kkWqcdwvpkeXDWrPi4vcpY5mIGIfYnzrfAPaGuzGuY2gNXr1eX7UIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzofhYUm9Mc1bK7p5TqwAz158lzxySiC+Tfppbo1rkU=;
 b=oD5cFCtln6qE6Yg6EyZflMxz4bHgHyvECe4EAqPyAB3ZOKp5HDvhDAh2otVFrqmG1O9r9nlnsFWhm/XaEjLcB9VTRy6cDROpth9zXxdPlQE7SP3hdQLb8M4V+ALjS5oVX+k4iu3Q6Yp++Of+lfx2TW7gjlPQlxfaBf4klkOABoCbwy/RzMzm/1d4qE2lPAraWLVO2SgQiki3pvRPB1OIaMKiQmVaVmLw2GekjcxLKATB8w3w9CQIFtLts9JhXMzsJj9FQV8bK7X6IbzW8hmPFGy+VmnboKrPki9/WiDKGcU//xFMEo319ePuvn52V2ltW40PjO4v1649DpOEXW/xpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzofhYUm9Mc1bK7p5TqwAz158lzxySiC+Tfppbo1rkU=;
 b=IHbfPHG/3L4VI8DOeca2m8UduNLqZyD8JisJNJzlY8TnK+BgiMuxuH/h69rmOrxnmJm4W7oRPqDlDJLViCo3qi/5ryKExJRhvAdqhb6wpqcfOhkuo5HJzDtWjXqqu+gqp4bfpAtEx7P7A1kolQkb+TyuvfRVU8clqRUF5kPlZlY=
Received: from DS1P223CA0003.NAMP223.PROD.OUTLOOK.COM (2603:10b6:8:453::8) by
 BY5PR12MB4099.namprd12.prod.outlook.com (2603:10b6:a03:20f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 14:53:47 +0000
Received: from DS3PEPF0000C37B.namprd04.prod.outlook.com
 (2603:10b6:8:453:cafe::73) by DS1P223CA0003.outlook.office365.com
 (2603:10b6:8:453::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.24 via Frontend Transport; Tue,
 12 May 2026 14:53:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF0000C37B.mail.protection.outlook.com (10.167.23.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 14:53:46 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 12 May
 2026 09:53:46 -0500
Received: from [172.31.11.23] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 12 May 2026 09:53:45 -0500
Message-ID: <9e3a88d9-1679-43ae-a96b-62a29bd45d9d@amd.com>
Date: Tue, 12 May 2026 09:53:40 -0500
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH 3/4] remoteproc: add helper for optional ELF resource
 tables
To: Daniel Baluta <daniel.baluta@oss.nxp.com>, Ben Levinsky
	<ben.levinsky@amd.com>, Bjorn Andersson <andersson@kernel.org>, "Mathieu
 Poirier" <mathieu.poirier@linaro.org>, <linux-remoteproc@vger.kernel.org>
CC: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "Magnus
 Damm" <magnus.damm@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <tanmay.shah@amd.com>
References: <20260511211841.284809-1-ben.levinsky@amd.com>
 <20260511211841.284809-4-ben.levinsky@amd.com>
 <3b7f009c-dc4b-4fc0-becc-4d07eb4ff016@oss.nxp.com>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <3b7f009c-dc4b-4fc0-becc-4d07eb4ff016@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37B:EE_|BY5PR12MB4099:EE_
X-MS-Office365-Filtering-Correlation-Id: 083f1460-c57f-47fd-966e-08deb036453a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|1800799024|18002099003|22082099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info:
	+o8GsQ1vLTFZs1Zu9UqH1HX9O3nauPjzkg3+kDyocOoXdPnp/r43RdW4rNbBaCXB/rZXK+4v9EW0+FwxJBtIqpQDUKbd0j6RA2iYHRgB2hdZeAoaUoCzNncrHm8yNT0MKy+obnxgkUaGWM9IORnRqJibApIVsIvEVu6JtuEEyCWJXVcea2brFsXfS8snjGBeJ/CydEZOG85x3ERrhHahf/T9xjiv8p7mwyfVFOFWL24fFyk6Kr5uzTF4Px0gJlUTDIq+TSljTuC0IFQkYUAofQUoTnu8Le8bI27jVrm9SGa7C8mYnoMOc5csEsnY4dOKgZWGG0JJyJbFgSO7LzDhRC7sS5EnjOqRRSoKOs7D3zRcOYNGo3Ip3IsX8WDtE1hh0Qrr+QNvmrJX3bZ/jyXVpLIwjocf6U8kJotjh23lp/cDwbfrFCeYc49XAAl9quonCuP8sfSEGt8CsLZa9zCt3G53AM39CRmU8/rMKDQgwlLTmFkDm4Ulpj4VmCyqGn6bt6m80RDys+S6f9nOgc2yrFLDz+/tfLdIhvlXcQdjDqppHSBnyg7GDNTCmvymXfZL5D8tRqpk1vIWOJ/zZ/SkEndNbWiiVR9vciJGpkQE+mq571uG27lJAqNGbYbr+GHb9hJJ3CwBQYLEbGtHmdVUh2ZfCfzRIP5suran8Bo4B+9LJeeBDBZXOI+2GGrsF/Rf+nbMMYCGc3mC4fgXydNvLNdCIqUht5RoOH5+bKy7DIU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(1800799024)(18002099003)(22082099003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3olwf2wK95yBFQGC5kzvb9Kj6X/UcEdzlYlBMveR18PNEr208F5vqlGVivvI/x9RNyjhuw+7N2ACi2Rj2F/8ur/hbmXyWGAb4A2r6Gc+048GUvqPBJcM9pIO/Dkc4h2EOOprj4TZUGunO61qGmTOSu0T6/O6m+vw5unkFo6PHMtRohvlNB5467dFC/W+aiLTkCT2Fd8jwHusykjG2zAxAoEubLfPmuMhqeFIuqRAU65f9YeL0mIs27ki8EPnE8epZDeMzLJmdAGRxpOo9caUCNPKyHPg/k2rw3y0W9mw7dQfLyt2FmOfn8TtkcllHQ8GTQyRhBQ+AzwPzpvP9W7SihsPu8abRz86zaR8AxJ5Ksu1IBomDMmMVQIcWBs8PxJXppy1T2vhwvEPtYOQHdYGIWJEYfxPzPoXhs8tbeCOHqPkAk0Lu7yiTMoB2D2AmR3X
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 14:53:46.8682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 083f1460-c57f-47fd-966e-08deb036453a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4099
X-Rspamd-Queue-Id: D2E2A523EB4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32496-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,aka.ms:url,amd.com:email,amd.com:mid,amd.com:replyto,amd.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,pengutronix.de,gmail.com,glider.be,foss.st.com,lists.linux.dev,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com,amd.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[tanmay.shah@amd.com];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_EQ_FROM_DOM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tanmays@amd.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	REDIRECTOR_URL(0.00)[aka.ms];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action



On 5/12/2026 2:55 AM, Daniel Baluta wrote:
> On 5/12/26 00:18, Ben Levinsky wrote:
>> [You don't often get email from ben.levinsky@amd.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Add a small helper around rproc_elf_load_rsc_table() for remoteproc
>> drivers that treat a missing ELF resource table as optional. The helper
>> returns success on -EINVAL and propagates other failures unchanged.
>>
>> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
>> ---
>>  drivers/remoteproc/remoteproc_internal.h | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
>> index 3724a47a9748..dff87e468837 100644
>> --- a/drivers/remoteproc/remoteproc_internal.h
>> +++ b/drivers/remoteproc/remoteproc_internal.h
>> @@ -146,6 +146,18 @@ static inline int rproc_mem_entry_iounmap(struct rproc *rproc,
>>         return 0;
>>  }
>>
>> +static inline int rproc_elf_load_rsc_table_optional(struct rproc *rproc,
>> +                                                   const struct firmware *fw)
>> +{
>> +       int ret;
>> +
>> +       ret = rproc_elf_load_rsc_table(rproc, fw);
>> +       if (ret == -EINVAL)
>> +               dev_dbg(&rproc->dev, "no resource table found\n");
> 
> You are changing loglevel here. Initial drivers use dev_info or dev_warn. At least I'm used
> with seeing this messages in the logs. 
> 
> So, what do you think on adding at least dev_info to this instead of dev_dbg?
> 

Actually can we leave that choice to the platform driver ? There are
many use cases where the remoteproc subsystem is used to load and start
the remote core and the firmware doesn't have the resource table. We
don't want to make info level log for such use cases, as the resource
table is not expected in the first place there.

>> +
>> +       return ret == -EINVAL ? 0 : ret;
>> +}
>> +
>>  static inline int rproc_prepare_device(struct rproc *rproc)
>>  {
>>         if (rproc->ops->prepare)
>> --
>> 2.34.1
>>
>>
> 


