Return-Path: <linux-renesas-soc+bounces-29612-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EG6uIxdduWnYAgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29612-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 14:54:31 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6432AB46E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 14:54:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A16F5300517D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 13:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322013CE489;
	Tue, 17 Mar 2026 13:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="kfDjiaA6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012059.outbound.protection.outlook.com [52.101.66.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967E03CD8D2;
	Tue, 17 Mar 2026 13:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773755666; cv=fail; b=aq2c9TMavKJDRkWOhdGlU4MweIwAJ17hbTA1P3ZHUZB/E57zWyicYPooSi/pBrichWc5M6N17ra+1sryFGqmHitYYj/IfeGuPxbX1aN3jRY2HMci9fXWK8iGXjnbcf9SLoWovEkjl/EEvN1PmNBKLG7YwR57wmCltvOLpXOC3u4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773755666; c=relaxed/simple;
	bh=h8vW9QFHEsbdwF3sZuZYLNzmqqdLN09PcEnZ1dPYIV0=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=az8Kvfg56fhnaBes9UW6y9G7tghueHzig9j0MqDNL0RkyKvbTDv+4go4WDXATJK9nqGLY97ewZ9vqB0wL9IWgP5OB9myLC9+H//EKwy7Xv8eHOVDYCscmSs9BvbeRfU5KPgjr7lVjhyyNSDRUVGOsp2vXOYp5SsRz7yJOTpsd+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=kfDjiaA6; arc=fail smtp.client-ip=52.101.66.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AqThbOnFQ8/SlDMtiUWjR9WZ3ATg2FYepBTcEpg+fSNBu1zBXcvGbLsz1GwmRWSvJlIhm5WJRvHeP/u+8K9GGCwZwIkrIrSZeAnQMQyfkZ5YBLzr4/pXrB11GYL7Z/GPC12p9+oR/jsw7GSePq3++4UdqyRTAxKUXiaPXoAAhT5IP90qgJJQtiqj/PDyViRSXqVKQDbVztdUh52pFNDrfOVmMKIgx9CsKtnCcRny2Q/Lpz7HbfyoEI5I/37PadnGbwSR94PTDkXL6JZtp3Qp9hPCsv+sRyNAHKJo7nafTdtozXhd9/6uqUG02I1OKThk30smYqktio2ojIFWJrKBow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8vW9QFHEsbdwF3sZuZYLNzmqqdLN09PcEnZ1dPYIV0=;
 b=k7OwV4RggN4Ch/OhZVZDDjgEcWNpApl/udsYwI9n9HoItWgfgyfo9oMP4hcHginn5YYHJqPP3sKu/V1nwLdyPPbcuzYkisKR2zlFTpHT6h0Q0I6h3RUrTKiRfKnauWAFNgKxBNE9rtiSJZCz/BwDiCrLvpXxKKTXh7GmVUGZIn+Tt5WBDtjuDS2Y+7xmOzolDevs96IMPt1s88mj+wfEgjk30wH/Xfv6ai0fDwFLpyt1Eg5+HBw/G7p9SZpSC0l647+UPlOqV9cqFfXvjuAUB79s5mQ2Vn9BubKezOZwnLmYlYCU9L/MXMhciRZXkMZ9HWu0OUi0ZfoP8+j+Q1ZpeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=sang-engineering.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8vW9QFHEsbdwF3sZuZYLNzmqqdLN09PcEnZ1dPYIV0=;
 b=kfDjiaA6i0BZjlyHKa0nFI0yNOfc0zEKrJvBXWCpHiiwfUiOmvcI8qmBFegUQNt654SF5USEB/M9GfLMmbj/HwI5fuIfbx5gR853hLCDyJ9f1+cc30r5egEfPG8uX/8YfsZxPzznhZvnaPOmvRj0ijO1KD3HRSZlt4Nlq0OSNoEThXqPkIfYnJIQdIL/je9RopaznemXZ8hQUUERtyIDCahvyBJ4K3ssvtXqEZMAOUX41HC4lUhVjoLjZU3DNf0QK4TTMTeZcKK6X2SAp5V1RqAUaZKVsjo2Wl8BOxO1FawBKrWfchhEMQkmnMlL3pVs47eEGiPdBEKU5UVil6ZGQw==
Received: from DB9PR06CA0009.eurprd06.prod.outlook.com (2603:10a6:10:1db::14)
 by FRZPR10MB9918.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:d10:1c9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 13:54:21 +0000
Received: from DU6PEPF00009524.eurprd02.prod.outlook.com
 (2603:10a6:10:1db:cafe::28) by DB9PR06CA0009.outlook.office365.com
 (2603:10a6:10:1db::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Tue,
 17 Mar 2026 13:54:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF00009524.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 13:54:20 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 17 Mar
 2026 14:56:53 +0100
Received: from [192.168.8.15] (10.48.87.74) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 17 Mar
 2026 14:54:18 +0100
Message-ID: <dd21653b7343e261ec9c88c622c5facbba69df95.camel@foss.st.com>
Subject: Re: [PATCH v4 04/15] hwspinlock: add callback to fill private data
 of a hwspinlock
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	<linux-renesas-soc@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>, Orson Zhai
	<orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-omap@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>
Date: Tue, 17 Mar 2026 14:54:16 +0100
In-Reply-To: <20260310075539.11701-5-wsa+renesas@sang-engineering.com>
References: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
	 <20260310075539.11701-5-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009524:EE_|FRZPR10MB9918:EE_
X-MS-Office365-Filtering-Correlation-Id: ea234ec9-7203-461c-b3ee-08de842cb02c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|7053199007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	AI6RG4Fx1UK97ITArYgTPro+HuBgaUhXw5pHiT1nDKsN1sThYItfefGOC35S28gXv2KuA2AOJn7lDPIfZAN1D3yD9c7U4i1KlKQlY53StGPCVd7YXzCPVzVwlxk7zdrWjAIKt6piU/I+aV3Ja2YE9hGLKAsQLnTqbGMa42oNxtVi2RTEH1vDufJf+6qvpdP3EnbYQpRl9hVd7Oj9xhY9ZZDILfrkqz+N9IYoS/+i53uwdUO6MGxuZZSKAfJwlaeAf/DfXJl79UFShAikn6M9VP9Fhm/J7ncNMQmwGEqQSQIm+yWcZzx5pSHRMf25zSH2aJOkhEZFyBt1zMDEacGbzDabOT8mMUFKQwrQU+qFpoiCFhwWrFbGf5s0kp+B0acPprHupJWW7iihE3Thi/SjXqa+n7o1VdbBGcW4nxuBzC21/u8eFRObQGmnlW90SQX2dqMgT+zfw7TDP3OUCsfJQEKvTMOvAk9QoogJoA1PWtX2TstTPwBNy6E+itbLMfMZgXh6bmdmz3ZtBk2Ja5b/4xvwE/0YLneNquW9l62MO6r+WA23tK2XOHnXQeK6h9iUJmS0LTJGtkb3fCT3ughg5fBEnpF31JR46Tvs9PYUknA6R3AERH+1F2ttxX+4vX2kCWIjA4uoml9ehB2+Bx1/knJCKsfH64AQkuqyCLpNfElbFlQzhyb45MSWWevoXXwFRwA2hPYK/yRBoXPoaijkLa6YbHSYBZWeVm0QLBgAZ2PrDk71pbj9b1PNvPs9dHju4xO3aL0HjECf3E7vFVfJzg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(7053199007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RmGw/7gVYBpsqbXd3U8AA7L9iVS99zZwjEk3NUyTsgI249tGBZGzN0ZFy4R3bdmMt1RsAqU5dT9Wl5DNQwn+UKl7KkdaN9vpTIvGziowzg3h+rLbJxGwDpvu8kocMRTaCt9nWgDRcNw3kWeZoWY+2D+m3Yl/y0Trmm6QAo00YiL8knSehHPhZh1+EWreR0sI3T8y/pte3YJWGa6aes3M+GWr+TtVcI0/lV0rxVwlipmowIDcKozAZT16A0u/Xe1KRuxO5cXF+eaM5LQj4p/VoX8qTgOfReYQ3/Q30YtNfJ34WpRQNU3e4jce6TWVjgnm34jdtKm+Jqn0G3ktRNfh0jaiiTF46z1tbmi/eX+1AW/EGVa6dfMrdlMTE8sZA2rzVu92e/4EgPA4/GttqFPihR04fdwInWoP2RyAv+tfn5GZatXooV8uyz5bnwAlsD7k
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 13:54:20.1205
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea234ec9-7203-461c-b3ee-08de842cb02c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR10MB9918
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29612-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linux.alibaba.com,gmail.com,foss.st.com,posteo.net,sholland.org,st-md-mailman.stormreply.com,lists.infradead.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,foss.st.com:dkim,foss.st.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antonio.borneo@foss.st.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8D6432AB46E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 2026-03-10 at 08:55 +0100, Wolfram Sang wrote:
> To hide internal core structures from providers, a callback is added to
> the ops which allows to set the 'priv' field of a hwspinlock. It is
> called when a hwspinlock device is registered and, thus, iterated over
> all locks. The register-functions are also extended to pass a data
> pointer to this callback, so it can do necessary calculations for the
> priv field of each hwspinlock. Providers are added only an empty
> placeholder and are converted separately because these changes need
> dedicated reviews.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> =C2=A0drivers/hwspinlock/hwspinlock_core.c=C2=A0=C2=A0=C2=A0=C2=A0 | 19 +=
++++++++++++++----
> =C2=A0drivers/hwspinlock/hwspinlock_internal.h | 19 +++++++++++--------
> =C2=A0drivers/hwspinlock/omap_hwspinlock.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +-
> =C2=A0drivers/hwspinlock/qcom_hwspinlock.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +-
> =C2=A0drivers/hwspinlock/sprd_hwspinlock.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +-
> =C2=A0drivers/hwspinlock/stm32_hwspinlock.c=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +=
-
> =C2=A0drivers/hwspinlock/sun6i_hwspinlock.c=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +=
-
> =C2=A0include/linux/hwspinlock.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
> =C2=A08 files changed, 33 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hw=
spinlock_core.c
> index 2c9eceba7fe8..afe1e7ce2829 100644
> --- a/drivers/hwspinlock/hwspinlock_core.c
> +++ b/drivers/hwspinlock/hwspinlock_core.c
> @@ -507,6 +507,7 @@ static struct hwspinlock *hwspin_lock_unregister_sing=
le(unsigned int id)
> =C2=A0 * @ops: hwspinlock handlers for this device
> =C2=A0 * @base_id: id of the first hardware spinlock in this bank
> =C2=A0 * @num_locks: number of hwspinlocks provided by this device
> + * @init_data: additional data passed on to the init_priv callback
> =C2=A0 *
> =C2=A0 * This function should be called from the underlying platform-spec=
ific
> =C2=A0 * implementation, to register a new hwspinlock device instance.
> @@ -516,10 +517,11 @@ static struct hwspinlock *hwspin_lock_unregister_si=
ngle(unsigned int id)
> =C2=A0 * Returns: %0 on success, or an appropriate error code on failure
> =C2=A0 */
> =C2=A0int hwspin_lock_register(struct hwspinlock_device *bank, struct dev=
ice *dev,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0const struct hwspinlock_ops *ops, int base_id, int num_lo=
cks)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0const struct hwspinlock_ops *ops, int base_id, int num_lo=
cks,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0void *init_data)

Hi Wolfram,

this API is described in Documentation/locking/hwspinlock.rst
in chapter 'API for implementors'.

Changing the API parameters should require updating the documentation too.

Since this API is changed again in 10/15, it's probably fine to update the
documentation only once in the last 15/15.

Best Regards,
Antonio

