Return-Path: <linux-renesas-soc+bounces-31316-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNIyHQ2K4GnFjQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31316-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 09:04:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1006C40ADD3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 09:04:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 66FCA3030184
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 07:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD9B36683D;
	Thu, 16 Apr 2026 07:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UdvHIbMq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010024.outbound.protection.outlook.com [52.101.229.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D2778F39;
	Thu, 16 Apr 2026 07:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776323078; cv=fail; b=sTOEhlidb1M1d2rcxWt/YmtoyZMmGIbf06W5MnZ40GmKSFQHHLCBeElJs7dXBNDFM4cZXYGkCApTvPeWsnIrNtDKOZ0qFILPRlJo2KasozAaQN82Mg9sN1e9CkFci7Fzx4qVuuDDhVQrFzngq55k6xSyXb8NtEidavFVAhYrt2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776323078; c=relaxed/simple;
	bh=DU3d7vyk8awMdrMfF/2/gziLimdFP5UDC/RuH5075cY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cefNADE8HrYXjxsHfGHM3bpH+lFWC+3v2zVcdj8E1dDs17lIvdHf8vHQjsXO8gQFqRKGhkbEIerNbCvb5IZomFTQ0m/UTwCHoB1du9xy5dnmUBNGIOr6JaZNQsXgJq14ZYywRbHKm94HO4lc6ZDws2CV5JjsBGemcIOGo1Et2Zs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UdvHIbMq; arc=fail smtp.client-ip=52.101.229.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IbhdIReWFjDvrjyzLmbDdWGjNU5f4y48l3nLoxB5g71tTu2niNilbLBw+gR8TaC50zlH1pIHkcV4uXzO6J0CCRWt5dMdR+UGUV0kn21Dy9rBy9u2N546rl2INAINoeeL8EaFHYFRhU7WwMe1n3+J4rB5V2PRckBjc9PF1U1jvZnXEyovxVCbB8eSehst7h5hsf55+UztjIbE2TfI+1vXyPF1vMDqvEiE7HTol+foImm8zz3SpEG8Nfo/12l+zH5q6P/bNPprLyypSw3OxQojyEL0hGNVo3F/TusbvTkwhJDMNgrFyW80PMePBwGlhdjg+ccR3a57Zp827UY1D5QHWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gX0d6NGmgNw2GVgvJQRfEFCw5EKG9zK2Z/djUwRZP/A=;
 b=vX5VyQBK0D9F/tASU/J8yABKttKui37T12945DLqr3zSUuOxpdgZAYpnUYEuAFRUSnZsyzVWO0JmvaffjJ8GmHem0FZqSDk4SJQdeULcNbLujik6T+SdcmY3QHRupYsXOKaNJwzwL7z4Bttos8CeymMfAiLjF4Pg70Qkun38p1JSzU+P61uuSX5WWndAfuv+2+z32NZeY5SNTkLJ9YpHQQrfkMo6B/pjJ3x3hdKqLb613U8OW1ofbAfkbhG5DayAhriGNGYW2VMVN4rn1qr8njDMC7HNixTQdB31vzwXtjTCqlofcxIlQKdByXPQB86jA7RBddai+i1WM1Ihk3r86g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gX0d6NGmgNw2GVgvJQRfEFCw5EKG9zK2Z/djUwRZP/A=;
 b=UdvHIbMqPJBbTw9yGBm2OVVU+B/4EYrkzTbx6VHb4D77G3KpDP3eTXUJUub+oUzRQMbaYlC2TC/zo+9j9KVDG9Ktk4OFPuFw4Zvryw/fTHDEVd+qMcrodaGEfYP1N1wSgYoOBRR+DClFa3Pe206MoN/kRmAD/ZTbuX2VHdBq4zA=
Received: from OS9PR01MB14288.jpnprd01.prod.outlook.com (2603:1096:604:35e::6)
 by TYYPR01MB10467.jpnprd01.prod.outlook.com (2603:1096:400:2f4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Thu, 16 Apr
 2026 07:04:34 +0000
Received: from OS9PR01MB14288.jpnprd01.prod.outlook.com
 ([fe80::dd81:2b0c:9be0:96be]) by OS9PR01MB14288.jpnprd01.prod.outlook.com
 ([fe80::dd81:2b0c:9be0:96be%6]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 07:04:34 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Paolo Abeni <pabeni@redhat.com>
CC: "paul@pbarker.dev" <paul@pbarker.dev>, niklas.soderlund
	<niklas.soderlund@ragnatech.se>, "kuba@kernel.org" <kuba@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"edumazet@google.com" <edumazet@google.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>
Subject: RE: [net-next,v3,13/13] net: renesas: rswitch: add vlan aware
 switching
Thread-Topic: [net-next,v3,13/13] net: renesas: rswitch: add vlan aware
 switching
Thread-Index: AQHcwqCePkOeETYiwUynZQ7u+2SaZ7XhWP5w
Date: Thu, 16 Apr 2026 07:04:33 +0000
Message-ID:
 <OS9PR01MB1428835873691ACFF359C5F3B82232@OS9PR01MB14288.jpnprd01.prod.outlook.com>
References: <20260331-rswitch_add_vlans-v3-13-c37f41b1c556@renesas.com>
 <20260402125946.234499-1-pabeni@redhat.com>
In-Reply-To: <20260402125946.234499-1-pabeni@redhat.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9PR01MB14288:EE_|TYYPR01MB10467:EE_
x-ms-office365-filtering-correlation-id: d7886bf3-4d97-4ad2-aebf-08de9b866a09
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 tH8DX9WUHtINZncHVgLkaB3lzNeJUt5QiikgRFCpLFZUh+ftTIY3zhnxMBtdNb4lejD4RY2vmqFCSY53VxiyAIndffKfHaRuOuxnrEw9dIHO5D7wv80TQfvVTdz/WkL9qyHWKFyUEM5uRV/v1wKgNqLtlo1pSHaYvUfRJyfFU+s3wuLLc0wFzTBza4T0wAgtqmfr1tsZUHCkdUYFQQzBbhJtZIUEOV9sz9YG+Bc/3rKffAXkHwLOgBuIOr/hxaH6rHqNRr026SSPLIhMkG2noocSweyKX1Mtnrr01rpSkhvV+RqMaUrfDAr7UncLGJ/CRUGzJFmdA/e2dV7PtaT+Ync0FQMXIfPluSTRcPxb7Q8h2L9V2ltdkG1nasSamk9OypGe7o/WePqxuhnl8GNBsSSJ84bP5YWnLaOXvPxh1ACF+mQ+De96zpFkwr0dfeTFShl9IHYve+/CYvkvTHowftr0Ut2mUZqGV4wuRKFCcWPwZr7l9AnN7zmhus8212YIutAgwS4CeVLhfT1m5qnFX3cWpJGMPRBQzMwVqV2kI7AnZbA1ZDeTxr9uUTwpKIWR2qRl4AK9tjg4X3D5wmJ+F/XmelxbZNsI33lSbZe1E6InA2nQt1Xtb7II3Mw4FoyxAGCEUKRQC5zVz6FHmr2BdjGNem6B5eGNQUMySxw5E3ArmWt4tvN3ibJiPG2trvP3g4Ho9TDJCFReV9TJecqzNHLu/ywKs+Un3UtzKSEztBbzTxOMQPLl3OiZ9OsBAXG8
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB14288.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?y9U8O5CjMIo2ypY2PWDkUEIv7+nPy7sCWkQGzBP866vC2+UWiY22snG6NS3Q?=
 =?us-ascii?Q?Ib3mSCpnjt+MV1CcSOY2R14b4QyQ9n8hLeOuy2Q7mQSLbuUsVJPOOhbupRx7?=
 =?us-ascii?Q?AD5Jy8r2vtrFV94ZRVoHu6GpyHuAj9bg7lsaFlmswh5ty9NeilrPtf1A7sJP?=
 =?us-ascii?Q?NXko2mc4G1J6+D2EAVS+0pOezYZAG9B3Fbc1j5Fs+MCUy0PQeBmGzBLsvkJz?=
 =?us-ascii?Q?uT+20+QLQphqRWaS4WGCkdybxynHKtf5iBXsf3IrsAmkSKhitxvgvMa8zQnq?=
 =?us-ascii?Q?3WV3IdcVjzCpTwJnCQYRmmcf6JAPMX+RN0RTDf1COg7FeuDwYeJaw6GtwTwZ?=
 =?us-ascii?Q?L2S5+ylkl5z6AQyW1zmE+laLdSm8jZM/GthoLtiKyhCW1+LTqOSQi/VDXuPa?=
 =?us-ascii?Q?lZIPZG59fYBJ//NTTJ7OMUNTTewBZ7u/2WdeQW3LGP3qgKLbdVlBOCvrdHkk?=
 =?us-ascii?Q?0mlq7nLm/UT77f1bhUQgP0bklY3sBdVLv6qofKdzFtGGts+whCHbmqUK6Yg1?=
 =?us-ascii?Q?EIBQSt0aS9htZLAkT6TuOyk8hobRKopydwDDfhX5QXoFzfHHMCBKzfMbHQam?=
 =?us-ascii?Q?lYy5kb3kuWqNYjUBw96P3OnpF4g4y7FQlMkimHxvxrjUMmT5h2jGW2IkuvmA?=
 =?us-ascii?Q?V1e3cZ7oEK16X8Eu9h65KnHXCQD5VUHf4TV/jkvsKl/2MBc6gLrmVLNyKbJD?=
 =?us-ascii?Q?rL6BBLe09i1RQwsC2i4NoZssQFLVwvJB54BdZ9Lr8gCXF+HpMSKrKmL/Z0GU?=
 =?us-ascii?Q?knP2sicCkzRRAwOS8rwSocaFzNt5OU+zU9wYWaRQ9khYWE9OTwpx+T4iF9NM?=
 =?us-ascii?Q?eqhe83dtGCltYZwbJisoXDiL9WMjfhaDEUoM2d0TUfXsplvxsYVFD/3Xa168?=
 =?us-ascii?Q?o8ykzxyZQGrwu50fUrk3PdC62GxG4ZLkQbpYHwnqKVDMXt+hWa3SdUO/kNan?=
 =?us-ascii?Q?qL86vSHmrbn41HgZIqYWjv866s7smOhq8Ju9IUWSXZVSBIKcJtHGhS5Flviy?=
 =?us-ascii?Q?erkmrlHie9gxUJhikkxxw5eIHF5ZvKelTdVKy4t3cAEQoOgSaWS5obqlFpEa?=
 =?us-ascii?Q?HAczV6Gk//7/fwbvWNbrLEQWm71/7zbZUEa58GcNT4ctW5wicRONVpFWoZ73?=
 =?us-ascii?Q?plb9aN3xsfcb7ryK2/vUpFNp7XM2UxjWSXbDZMCPeIJNY4bRRBCrIUpD5RzA?=
 =?us-ascii?Q?2lwHpM58yDbpusaUvkr9LdfrE7SoI9PMt6Vy8Rmeqj6sRfrhRA9lvBUjfzJW?=
 =?us-ascii?Q?JOLE3wxEMUHMPdQ2N+mny9UeGQgUbpL885/ZVEEGd2ngKep9+j+6ppeoSC5L?=
 =?us-ascii?Q?iFZG8Y7j3nq/QZgh0NEXmrEvw+ZSrFYkujVJLH3+d0d6FwtTJKORrBOCZH69?=
 =?us-ascii?Q?PCJRu5B1Jcz4h/laLMnO+ocM+OjnBiFYXgm+74MYwT4Cx3nmBL2qwCvgtwyJ?=
 =?us-ascii?Q?cIVXFLl293xEI82Ia815g5kLUOram9HVJ5cEo4hLIRTE5VacCTUVyeYs7LJE?=
 =?us-ascii?Q?dbVeehK0i30BwSHq1r5JGO9sNcX4zM/mSLOi+5cWE1OYc08kUnU2zf9MJVOW?=
 =?us-ascii?Q?ZIBkWHCWdXcjUZshBk2+hxLaozgxnOxpPIcRHM/u14PjIZcByTh9vsDV5I94?=
 =?us-ascii?Q?0a6lDwh3Q/0B1v/FmVRPk6IUs4p0/7+SJEsHp8be+UWFvKuAwE3fiqjmItkq?=
 =?us-ascii?Q?w7JYzy52Y9kwCZJ4Re+JdM8cXmWqB3vr6k4y2oGCM8SJItaSFk23t8TLb96C?=
 =?us-ascii?Q?sE4iL+Tmug=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB14288.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7886bf3-4d97-4ad2-aebf-08de9b866a09
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2026 07:04:33.9922
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dyh3CgwxTsNvs9jlkCy/RHISl3LbS+0N/rM0P8t+LO4O0wfHY8R5Jpk7fJrTqJNF2a/4ztKZ6hi8ibjifLjai7GJpXbSz9AkfslZssXyKow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB10467
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31316-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN_FAIL(0.00)[74.135.232.172.asn.rspamd.com:server fail];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[renesas.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux.dev:url,pbarker.dev:email]
X-Rspamd-Queue-Id: 1006C40ADD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Paolo,

Thank you for your review comments.

> -----Original Message-----
> From: Paolo Abeni <pabeni@redhat.com>
> Sent: Thursday, April 2, 2026 3:00 PM
> To: Michael Dege <michael.dege@renesas.com>
> Cc: paul@pbarker.dev; niklas.soderlund <niklas.soderlund@ragnatech.se>; k=
uba@kernel.org; Yoshihiro
> Shimoda <yoshihiro.shimoda.uh@renesas.com>; netdev@vger.kernel.org; linux=
-kernel@vger.kernel.org;
> edumazet@google.com; pabeni@redhat.com; linux-renesas-soc@vger.kernel.org=
; andrew+netdev@lunn.ch;
> davem@davemloft.net
> Subject: Re: [net-next,v3,13/13] net: renesas: rswitch: add vlan aware sw=
itching
>
> This is an AI-generated review of your patch. The human sending this emai=
l has considered the AI
> review valid, or at least plausible.
>
> For local reproduction steps see
> https://netdev-ai.bots.linux.dev/ai-
> local.html&data=3D05%7C02%7Cmichael.dege%40renesas.com%7C10d1c680d41c4e17=
dc2408de90b7bf4a%7C53d82571da19
> 47e49cb4625a166a4a2a%7C0%7C0%7C639107316024723538%7CUnknown%7CTWFpbGZsb3d=
8eyJFbXB0eU1hcGkiOnRydWUsIlYi
> OiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7=
C%7C&sdata=3DKVia3Rm%2FIDae%2Fq
> NCrKk08fsOpcv%2FnSMZoApYSZsLCYI%3D&reserved=3D0
> ---
> net: renesas: rswitch: add vlan aware switching
>
> This commit adds vlan support to the L2 HW bridge, with limited support o=
n R-Car S4 (not fully 802.1Q
> compliant).
>
> > diff --git a/drivers/net/ethernet/renesas/Kconfig
> > b/drivers/net/ethernet/renesas/Kconfig
> > index 9b7559c88bee..2494ff60e8c2 100644
> > --- a/drivers/net/ethernet/renesas/Kconfig
> > +++ b/drivers/net/ethernet/renesas/Kconfig
>
> [ ... ]
>
> > diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c
> > b/drivers/net/ethernet/renesas/rswitch_l2.c
> > index ea95a87ed234..b7d0e7f94ecd 100644
> > --- a/drivers/net/ethernet/renesas/rswitch_l2.c
> > +++ b/drivers/net/ethernet/renesas/rswitch_l2.c
>
> [ ... ]
>
> > @@ -212,61 +197,397 @@ static int rswitch_netdevice_event(struct
> > notifier_block *nb,
>
> [ ... ]
>
> > +static int rswitch_handle_port_obj_add(struct net_device *ndev,
> > +                                  struct notifier_block *nb,
> > +                                  struct switchdev_notifier_port_obj_i=
nfo *info) {
> > +   struct switchdev_obj_port_vlan *p_vlan =3D SWITCHDEV_OBJ_PORT_VLAN(=
info->obj);
> > +   struct rswitch_private *priv;
> > +   int err;
> > +
> > +   priv =3D container_of(nb, struct rswitch_private,
> > +rswitch_switchdev_blocking_nb);
> > +
> > +   if ((p_vlan->flags & BRIDGE_VLAN_INFO_MASTER) ||
> > +       (p_vlan->flags & BRIDGE_VLAN_INFO_RANGE_BEGIN) ||
> > +       (p_vlan->flags & BRIDGE_VLAN_INFO_RANGE_END) ||
> > +       (p_vlan->flags & BRIDGE_VLAN_INFO_ONLY_OPTS))
> > +           return NOTIFY_DONE;
> > +
> > +   switch (info->obj->id) {
> > +   case SWITCHDEV_OBJ_ID_PORT_VLAN:
>
> Can the flag checks access the wrong memory? The code casts info->obj to =
switchdev_obj_port_vlan
> before checking info->obj->id. When the notifier delivers a non-VLAN obje=
ct (such as
> SWITCHDEV_OBJ_ID_PORT_MDB for multicast group changes), SWITCHDEV_OBJ_POR=
T_VLAN() performs an
> incorrect container_of cast, and p_vlan->flags reads bytes from a differe=
nt struct type.
>
> For switchdev_obj_port_mdb, the p_vlan->flags field overlaps with the fir=
st
> 2 bytes of the addr[ETH_ALEN] MAC address field. Multicast MAC addresses =
always have bit 0 of the
> first byte set, which matches BRIDGE_VLAN_INFO_MASTER (1<<0), causing the=
 function to return
> NOTIFY_DONE instead of falling through to the default case that returns -=
EOPNOTSUPP.
>
> Other switchdev drivers (lan966x, mlxsw, cpsw) perform the SWITCHDEV_OBJ_=
PORT_VLAN cast inside the
> SWITCHDEV_OBJ_ID_PORT_VLAN case, not before the type switch.
>
> The same issue exists in rswitch_handle_port_obj_del().

Thank you this makes sense, I changed it.

Best regards,

Michael
>
> > +           if (!is_rdev(ndev))
> > +                   err =3D rswitch_port_obj_do_add_gwca(ndev, priv, p_=
vlan);
> > +           else
> > +                   err =3D rswitch_port_obj_do_add(ndev, p_vlan);
> > +
> > +           if (err < 0)
> > +                   return err;
> > +
> > +           break;
> > +   default:
> > +           return -EOPNOTSUPP;
> > +   }
> > +
> > +   info->handled =3D true;
> > +
> > +   return NOTIFY_DONE;
> > +}
> > +
> > +static int rswitch_handle_port_obj_del(struct net_device *ndev,
> > +                                  struct notifier_block *nb,
> > +                                  struct switchdev_notifier_port_obj_i=
nfo *info) {
> > +   struct switchdev_obj_port_vlan *p_vlan =3D SWITCHDEV_OBJ_PORT_VLAN(=
info->obj);
> > +   struct rswitch_private *priv;
> > +   int err;
> > +
> > +   priv =3D container_of(nb, struct rswitch_private,
> > +rswitch_switchdev_blocking_nb);
> > +
> > +   if ((p_vlan->flags & BRIDGE_VLAN_INFO_MASTER) ||
> > +       (p_vlan->flags & BRIDGE_VLAN_INFO_RANGE_BEGIN) ||
> > +       (p_vlan->flags & BRIDGE_VLAN_INFO_RANGE_END) ||
> > +       (p_vlan->flags & BRIDGE_VLAN_INFO_ONLY_OPTS))
> > +           return NOTIFY_DONE;
> > +
> > +   switch (info->obj->id) {
> > +   case SWITCHDEV_OBJ_ID_PORT_VLAN:
> > +           if (!is_rdev(ndev))
> > +                   err =3D rswitch_port_obj_do_del_gwca(ndev, priv, p_=
vlan);
> > +           else
> > +                   err =3D rswitch_port_obj_do_del(ndev, p_vlan);
> > +
> > +           if (err < 0)
> > +                   return err;
> > +
> > +           break;
> > +   default:
> > +           return -EOPNOTSUPP;
> > +   }
> > +
> > +   info->handled =3D true;
> > +
> > +   return NOTIFY_DONE;
> > +}
>
> [ ... ]


