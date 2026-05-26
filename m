Return-Path: <linux-renesas-soc+bounces-33166-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBkfBJJ2FWrHVAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33166-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 12:31:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A63C65D4339
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 12:31:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 012CB30067A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 10:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09ECE3DD841;
	Tue, 26 May 2026 10:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nMkqo6MM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010014.outbound.protection.outlook.com [52.101.228.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC042C326F;
	Tue, 26 May 2026 10:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779791503; cv=fail; b=lnSbglzrqJ/Kht8AtfbPhyNRcmIj0Dd8iXcj0OliAGst99c2usokEsKJLe0Cqx8YdThli9BzTy8q3FHWwcIhn3Ai696emfm9JbiIF5bq9nguKs4y5GJ4zCc2FhLhRHOIXqnM/eK00DEuP5xZbTJy3AE9iFsppbjDn2NBAVG1LNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779791503; c=relaxed/simple;
	bh=ShEkKHE6D7kksQrC19aAHWc6gMAMoXkA1AMnJYV/oDI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Y/tLPJnDCXLyNX0vT6U19g+O/JSpIcLNtwPEA3NbNvRb3U8SIRozpopBpoZBYSq7t0xM4i1WIEwR8p8+fKsyLRbMoXSYxTfRxvV+VJ7pOb7pfZEhwm+Uv9S/+f7o3Wu7joMWT/5WCieZqQ/xx/Iz2mGrsLIkt/8txfBgqUeCG60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nMkqo6MM; arc=fail smtp.client-ip=52.101.228.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QY1IcbmUbQd2mJSE1PZedPhrl3AoAA8RRBEBFoM47B6rsdeuHK+4F+oCG/AaMrEhiC5EySWMcryTM9A35zle6HeMmYAv4FSgXaKJuS9SkmqUAnfVFJIpwhvV9izWh3mJUuTLjweltWmw45aqSIej/0wv8ScfsA9E3t/zLJTdWEqGiGH0Gc28LZFYb8c2IcsnEJQuVtCGptB0FotvA0uPlGK2fflbhNRMePSZCMi5830XIyM3lGpzgVN8QCtIBuX0gMKeOLTTqHik98j8Wm6Wc1K75bQInMSI+BO0LcrcU4X/hi73M5ureWDk4Ud7B+1vaEVBZ3ReVsqaDsuOOBpArA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOkwTZVBBHfDJC/443JBminh7/fgFp60qLz6dUdB2Ew=;
 b=hw+3cyHw6cCRmXNhzqQUGoPqr2BG5L2k35br4mEcyMHeiuSsAlyriZtOihDqSZY0+Rt2M+zG0TkfzWpfa8HceeQa2sAbs9qdd6nQ9B5rOBRhnHgUWR5uSs82Z0H1mE5287ztD9CiAuOiGrgE3k5tKcHTQFzpJPNxYVEzV341o8Umt1JjyNuuK4utMYmBwgA+nlkbkywyaquoyfObT0+k+wXyy75mg5OutHiFq+xsCarGkqrWzxWtrh0jepbBprXdZiAu6nW9yTocm3J4muIgFVM+UNzk7vjG/lgQoV36sHhxaaX/oNrLZ+T6oZLO+6OsjC88dTBQSf6xNl7CI28nmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOkwTZVBBHfDJC/443JBminh7/fgFp60qLz6dUdB2Ew=;
 b=nMkqo6MM6QDAt2RlgjbeFx3EWpaDb7VL8qE6f9OTmG/fM8W6eNFKVqLcRDEp4RRrO3sYjrxMcNTkS7m5NtIDn6ab5w/mszBXsrwDPoDHj/eXDvGYUeMq9EsMJa8+E+oqfXQd1/+8U4HIACnEiyY1ma/0G3pe7CEvmiB1EkSSipE=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by OS7PR01MB17808.jpnprd01.prod.outlook.com (2603:1096:604:444::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 10:31:38 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 10:31:38 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"pabeni@redhat.com" <pabeni@redhat.com>, niklas.soderlund
	<niklas.soderlund@ragnatech.se>, "paul@pbarker.dev" <paul@pbarker.dev>,
	"richardcochran@gmail.com" <richardcochran@gmail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH net-next v5 05/14] net: renesas: rswitch: add exception
 path for packets with unknown dst MAC
Thread-Topic: [PATCH net-next v5 05/14] net: renesas: rswitch: add exception
 path for packets with unknown dst MAC
Thread-Index: AQHc6eRaJ2UvGmQN2UGbyfiNT9VKZ7YfOdoAgADV5HA=
Date: Tue, 26 May 2026 10:31:38 +0000
Message-ID:
 <TY4PR01MB14282A30277C256D90EDD9CB6820B2@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20260522-rswitch_add_vlans-v5-5-53589d944a9f@renesas.com>
 <20260525204110.2471291-1-kuba@kernel.org>
In-Reply-To: <20260525204110.2471291-1-kuba@kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|OS7PR01MB17808:EE_
x-ms-office365-filtering-correlation-id: 5fef503e-b9fb-4a45-af0c-08debb11f80d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|11063799006|5023799004|6133799003|4143699003|18002099003|22082099003|56012099003|10063799003|38070700021;
x-microsoft-antispam-message-info:
 C6qf/W67emF3ajoRjBOTWJdLXvuv2Ahh4F9O1PWmx/wtdj68Z/mFOwP2Zy7Gj9AwW/wwyZ+omWsshS05AqohsWSY2P6IeZ2eJOOTapo7UdV0PC5qPKkt8h4xrkqJfJY/EjXjc4xm+0PD3mLKtNzVlMQfFHp000uqCxryvjuBRlAeVK5Cb6piLmyDocUZmOCJiJa4cAGREzMhgzymG8VsclWmAVBTu624a1+m/EYlQ1us/mjubIJepFb94QXdRIcxJW/ns234HmVyFKzkJy8xn0hOBD4ZHPdlvKvgKnjaC4ZdAGdp0M0/mObbWuOeVlQ3FwQEX2puq2oWEQMDZ8rMHL2faQtmgSmbjqheYTIOcqHHTWsUuF3IBET3hk+cGUwzFURTy0EvQSfj0OYObJwIafmaAo1jSB4HuaszX3tKo1fnRhqV+OSGEum7vB4ZEibpVC3i2dGPiN2/8+tvPt3DMC4TtlvOcXuV4wCNMUhbctcPDW/Fp4JOyC5KRSsviDA7/NdsXbLGxv6nzZlTriOPg32V/FxOcsk5XyHYRSSbPnVEhOyAjzZJhrWXsVBikNYCmT9IhsQhRdS3cqJmFz0dzY+qiX6Y6MceVDdggGIiUTGTbH9sqGZn6depo+cp31FjHNiPLC+EqdBYjCD20nvmAkeLHK++5VsPA/doSLWxD4Z5/OaaHDIIZ0myfynCW/dFZWZLLH5v1qsvRHHayY/gxMBghvDpUMYc67qXdUXvw7p4ecwWmPgqktUMt7hYRzNI
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(11063799006)(5023799004)(6133799003)(4143699003)(18002099003)(22082099003)(56012099003)(10063799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?2Qcw3XaFaKR3FQ2jQN9EYyFVv7ZjMnzihaK+o/4COt6dV+rblXCsUpGLGH4g?=
 =?us-ascii?Q?Tx3tYol9fAi5t1dDYXHoNcGHoDpD4qywg7gbVcXWg5H6QckBPzoCrS6yUYhw?=
 =?us-ascii?Q?QIzcb/RZDuq4XrVZnjzxWbovTy87pYVs2pBmvvcbhnYS11D1Vr0p7DVbfJ87?=
 =?us-ascii?Q?viPBP7YvSwb8y4RHQ3zEF7NKmdnhtnvW4OFgtLbtsAb/jlPYt8p+lzncLq6m?=
 =?us-ascii?Q?98iQWFSl7VFvLcqZNZVlcDm8u5/6OoXzRyljNr73+YLIafDLfx7TqG7jWMnF?=
 =?us-ascii?Q?0MJwgojph8oHlqOxOLrPUWzTl0TYQfvhwF0vb/S1lwDGtHEZF7FyOMiyXonN?=
 =?us-ascii?Q?qK+Kckt9NGZm4nEiS/ZTha5MTV+Vp15Oh0pgimVnKhl785EZyQtb+bPABTw+?=
 =?us-ascii?Q?sBZY3Rv4VGh8vpvqI1YQ5ZyXXYyAnv9nA3s4p7rz5fuDegsHShhWwUsl4T/E?=
 =?us-ascii?Q?jNFjrycw3yZjFLU2S1UVBYxjbh7lZ47MTfcRczVrwFQSvUfefrMCbQ1yQdj5?=
 =?us-ascii?Q?XGV4XvwHCF4rkcaRy0k5llKT27v4gufiJnGoPD6zoIZEp+NgZu+8DTj3PRh6?=
 =?us-ascii?Q?Ce2JlCzjtNiPw/IvSuErls5ArJMJ9fp8s7QQiUpWCD2wXyvSzCP15N5R/TP6?=
 =?us-ascii?Q?jxq+veSBMm12L1d6AWh1qlOPylXUcNBwQEfcLnxZJyu2ocMIFkYy8Uddr+lp?=
 =?us-ascii?Q?yxIjqsg5uA3JvmST9VZN7RexeBRDlQ8aOXu2ZpH0ZC46l8lc5BY4wxJU6+YT?=
 =?us-ascii?Q?JO1Jtl3/+2zDdCIDMHP6I1Gmh0msNqSDPA1AUV6XoLdgxGH6gxWFJmvlmARZ?=
 =?us-ascii?Q?B5+PUXRCtA1vOovxBglEuBteWI6DLFxIC9VcfcJ69pA2nE8Oenw0T/40VOS/?=
 =?us-ascii?Q?ketL45+cwdOw8eIU4qwG2mqAkXvIXpr/k/J4yPm5hILWXwaCMTh47oIOCxqu?=
 =?us-ascii?Q?p4ZrJVwgd+QQiyMFe6+D/jK93ogQFb5cWpZO3pKJLCw95DzHKE4dYGCVfOU7?=
 =?us-ascii?Q?c5rGPaaEdt5UjcqYgkk9AnAgfUcZ7JXtES9/h3SNLIrlnAZTbufKOD9mTr0q?=
 =?us-ascii?Q?jmJrDjpqMuUO48OgBXcFAw/ZvgkVncy0qNK3z/e4Uyst3OK3A1Ly6+OVBb/G?=
 =?us-ascii?Q?RPeuj/joEMMVFnSQIES3jtLPKaDh0u3vBOZn0yCQGynD3ojH9n+HG/foV2+0?=
 =?us-ascii?Q?vabZ3m3GwupliKxrb6Qqyky9Pd/yOIDzBqcKxScSJ9d7BdUuAUx1j0raBlzF?=
 =?us-ascii?Q?uRyzm0NwUktxAr/AfbSki8lZZljvYBspTQM0/jdeGazFNSyX7KdyHn2/EQ/w?=
 =?us-ascii?Q?SR0ul0ASH7y5vfnxJBRkRSmM9btpNkat/l/L0k1bzloU445IGFmLHe1X+NIG?=
 =?us-ascii?Q?bj2RMY45ylVzyOj85eIVQQxBFWMZDSTLs037lNxJkuduBVdHMwB1LncESxuJ?=
 =?us-ascii?Q?AUVqlKp9ON4e2rciGZfG2j0HsngJ6gmjsYHd3E1CRSpAEqMN8TtmzNlXMyO5?=
 =?us-ascii?Q?VAcjsVhkiT7r6w+MOCw8kGK44aO5DzIsbOvoAZ8sYbSFLzC0BDJSCu3tnvo7?=
 =?us-ascii?Q?/MqIJEHqV2LEKNZiWvVJjFZJ788GyhcZ5jdSOAZ9vNKa9kBxUc1hDRSUJKfy?=
 =?us-ascii?Q?gEePMp91oX3MRXZuoQ5wxEgLtwIxE0OwaP7rZJZhBr8XqjIySiJT8qNbKZ7e?=
 =?us-ascii?Q?GDd3E+MT1BM9dfRWA6dbgNEL8KJf2ymcsRfDNsq7mSQEpWaDOitKLanp4FKO?=
 =?us-ascii?Q?CgB1dqQW1Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14282.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fef503e-b9fb-4a45-af0c-08debb11f80d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 10:31:38.3073
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UlwK+cfs8rP7+Gjlwj9KHf5Tke0ay5Sh1wTShSlzI4dyPzdUCO/7uQ4IjkuMYgdDYxdEawPIe4Hz5GHeUoM++NDqgmEJau+FZVc+DHIPAt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17808
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33166-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[renesas.com,lunn.ch,davemloft.net,google.com,redhat.com,ragnatech.se,pbarker.dev,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,renesas.com:email,renesas.com:dkim,ragnatech.se:email,pbarker.dev:email]
X-Rspamd-Queue-Id: A63C65D4339
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Jakub,

Thank you for your review.


> -----Original Message-----
> From: Jakub Kicinski <kuba@kernel.org>
> Sent: Monday, May 25, 2026 10:41 PM
> To: Michael Dege <michael.dege@renesas.com>
> Cc: Jakub Kicinski <kuba@kernel.org>; Yoshihiro Shimoda <yoshihiro.shimod=
a.uh@renesas.com>;
> andrew+netdev@lunn.ch; davem@davemloft.net; edumazet@google.com; pabeni@r=
edhat.com; niklas.soderlund
> <niklas.soderlund@ragnatech.se>; paul@pbarker.dev; richardcochran@gmail.c=
om; netdev@vger.kernel.org;
> linux-renesas-soc@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH net-next v5 05/14] net: renesas: rswitch: add excepti=
on path for packets with
> unknown dst MAC
>=20
> This is an AI-generated review of your patch. The human sending this emai=
l has considered the AI
> review valid, or at least plausible.
> ---
> net: renesas: rswitch: add exception path for packets with unknown dst MA=
C
>=20
> Packets with unknown MAC address cannot be handled by the HW forwarding.
> Creates an exception path with a shared queue to forward these packets to=
 the network driver for MAC
> learning.
>=20
> > diff --git a/drivers/net/ethernet/renesas/rswitch_main.c
> > b/drivers/net/ethernet/renesas/rswitch_main.c
> > index 9510bcdf9e830..1f4ec65f6f9bd 100644
> > --- a/drivers/net/ethernet/renesas/rswitch_main.c
> > +++ b/drivers/net/ethernet/renesas/rswitch_main.c
> [ ... ]
> > @@ -736,6 +772,8 @@ static int rswitch_gwca_hw_deinit(struct rswitch_pr=
ivate *priv)
> >  	if (err < 0)
> >  		return err;
> >
>=20
> [Severity: Medium]
> Will this leak the shared RX queue memory if rswitch_gwca_change_mode() f=
ails during teardown and
> returns early?
>=20
> > +	rswitch_shared_rx_queue_free(priv);
> > +
> >  	return rswitch_gwca_change_mode(priv, GWMC_OPC_DISABLE);  }
> [ ... ]
> > @@ -944,10 +982,15 @@ static int rswitch_poll(struct napi_struct
> > *napi, int budget)
> >
> >  	if (napi_complete_done(napi, budget - quota)) {
> >  		spin_lock_irqsave(&priv->lock, flags);
> > +		if (rdev->rx_old_queue) {
> > +			rdev->rx_queue =3D rdev->rx_old_queue;
> > +			rdev->rx_old_queue =3D NULL;
> > +		}
> >  		if (test_bit(rdev->port, priv->opened_ports)) {
> >  			rswitch_enadis_data_irq(priv, rdev->tx_queue->index, true);
> >  			rswitch_enadis_data_irq(priv, rdev->rx_queue->index, true);
> >  		}
> > +		rswitch_enadis_data_irq(priv, priv->gwca.l2_shared_rx_queue->index,
> > +true);
>=20
> [Severity: Critical]
> Does unmasking the shared RX queue globally here create a race condition?
>=20
> If Port A completes NAPI while Port B's NAPI is still actively polling th=
e shared queue, couldn't
> another interrupt fire, scheduling another NAPI and resulting in multiple=
 NAPIs running concurrently
> on the same shared queue?
>=20
> This might cause lockless concurrent modifications to gq->cur and gq->dir=
ty, leading to list
> corruption.

No, this is not the case. The exception path and therefore also the shared =
queue is only used cases=20
when the HW cannot find the MAC address in the hash table. The HW sorts the=
se packets into this special
queue. Even if a packet with an unknown MAC address is received from a diff=
erent port, it will take the
same path as the previous. Currently we only support a single GWCA (CPU) po=
rt.

All other packets are sorted into the correct queues by the HW. And don't l=
and in the shared queue.

>=20
> >  		spin_unlock_irqrestore(&priv->lock, flags);
> >  	}
> >
> [ ... ]
> > @@ -960,15 +1003,41 @@ static int rswitch_poll(struct napi_struct *napi=
, int budget)
> >  	return 0;
> >  }
> >
> > -static void rswitch_queue_interrupt(struct net_device *ndev)
> > +static void rswitch_queue_interrupt(struct rswitch_private *priv,
> > +struct rswitch_gwca_queue *gq)
> >  {
> > -	struct rswitch_device *rdev =3D netdev_priv(ndev);
> > +	struct rswitch_ext_ts_desc *desc;
> > +	struct rswitch_device *rdev;
> > +	struct net_device *ndev;
> > +	unsigned long flags;
> > +	u32 spn;
> > +
> > +	/* If we receive a shared queue through the exception path, it will b=
e missing the ndev
> > +	 * pointer. This needs to be added to be able to determine from which=
 port the packet was
> > +	 * received. Then we temporarily exchange the rx_queue pointer in rde=
v. This will be
> > +	 * restored after the packet has been processed.
> > +	 */
> > +
> > +	if (gq->index =3D=3D priv->gwca.l2_shared_rx_queue->index) {
> > +		desc =3D &gq->rx_ring[gq->cur];
> > +		spn =3D FIELD_GET(SPN, le64_to_cpu(desc->info1));
>=20
> [Severity: Medium]
> Could this read stale or garbage data from the descriptor?
>=20
> It appears to read the DMA descriptor without verifying that the hardware=
 has handed ownership back to
> the CPU (e.g., checking DT_FEMPTY) and without a dma_rmb() barrier before=
 the read.
>=20
> [Severity: High]
> Is it possible for the hardware to provide an out-of-bounds SPN value her=
e?
>=20
> Since spn is used to index priv->rdev[] on the next line, an unexpected o=
r corrupted value might cause
> an out-of-bounds memory access.

Does this mean we cannot trust the GENMASK and FIELD_GET macros to return t=
he current bit fields?=20

>=20
> > +		ndev =3D priv->rdev[spn]->ndev;
> > +		rdev =3D netdev_priv(ndev);
> > +		gq->ndev =3D ndev;
>=20
> [Severity: High]
> Since the shared queue collects exception packets from all ports, will th=
is assign the entire queue to
> the NAPI of the first packet's port?
>=20
> When NAPI polls and drains the queue, it seems subsequent packets might b=
e injected into the network
> stack under the first packet's ndev, even if they originated from differe=
nt physical ports.

Only packets with previously unlearned MAC address are inserted into the sh=
ared queue. All other packets
are sorted into the per port queue if they are aimed at the GWCA (CPU). All=
 other packets aimed at=20
physical ports are forwarded in hardware and not seen by the CPU.

>=20
> > +		/* store original rx_queue */
> > +		spin_lock_irqsave(&priv->lock, flags);
> > +		rdev->rx_old_queue =3D rdev->rx_queue;
> > +		rdev->rx_queue =3D gq;
>=20
> [Severity: High]
> Can rdev->rx_old_queue be permanently overwritten with the shared queue p=
ointer here?
>=20
> If a second shared queue interrupt fires before NAPI completes and restor=
es the pointer, the handler
> will execute this path again and overwrite the saved normal queue pointer=
 with gq, leaking the normal
> RX queue.

There is only one shared queue.

>=20
> > +		spin_unlock_irqrestore(&priv->lock, flags);
> > +	} else {
> > +		rdev =3D netdev_priv(gq->ndev);
> > +	}
> >
> >  	if (napi_schedule_prep(&rdev->napi)) {
> > -		spin_lock(&rdev->priv->lock);
> > -		rswitch_enadis_data_irq(rdev->priv, rdev->tx_queue->index, false);
> > -		rswitch_enadis_data_irq(rdev->priv, rdev->rx_queue->index, false);
> > -		spin_unlock(&rdev->priv->lock);
> > +		spin_lock(&priv->lock);
> > +		rswitch_enadis_data_irq(priv, rdev->tx_queue->index, false);
> > +		rswitch_enadis_data_irq(priv, rdev->rx_queue->index, false);
> > +		rswitch_enadis_data_irq(priv, priv->gwca.l2_shared_rx_queue->index,
> > +false);
>=20
> [Severity: Critical]
> If napi_schedule_prep() returns false (because the target NAPI is already=
 running), hardware
> interrupts are not disabled. Could this lead to an immediate interrupt st=
orm for the shared RX queue?

As far as I see the situation, no more so, than for the other queues.=20

>=20
> > +		spin_unlock(&priv->lock);
> >  		__napi_schedule(&rdev->napi);
> >  	}
> >  }
> [ ... ]
> > @@ -1653,6 +1733,11 @@ static int rswitch_stop(struct net_device *ndev)
> >  	rswitch_enadis_data_irq(rdev->priv, rdev->tx_queue->index, false);
> >  	rswitch_enadis_data_irq(rdev->priv, rdev->rx_queue->index, false);
> >  	bitmap_clear(rdev->priv->opened_ports, rdev->port, 1);
> > +	if (bitmap_empty(rdev->priv->opened_ports, 1))
>=20
> [Severity: High]
> Does this check use the wrong size argument?
>=20
> The second argument to bitmap_empty() is nbits. By passing 1, it seems it=
 only checks if bit 0 is
> empty. If port 0 is closed while other ports are open, this would evaluat=
e to true and prematurely
> disable the shared RX queue interrupt for the remaining active ports.

This is an error. I will fix this.

Best regards,

Michael

>=20
> > +		rswitch_enadis_data_irq(rdev->priv,
> > +					rdev->priv->gwca.l2_shared_rx_queue->index,
> > +					false);
> > +
> >  	spin_unlock_irqrestore(&rdev->priv->lock, flags);
> >
> >  	napi_disable(&rdev->napi);

