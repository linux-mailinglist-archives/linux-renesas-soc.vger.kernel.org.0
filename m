Return-Path: <linux-renesas-soc+bounces-28578-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yF2tHdC/oWnPwAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28578-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 17:01:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1EF1BA762
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 17:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1DE55303EE80
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC0EF449EC1;
	Fri, 27 Feb 2026 15:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="qAOYAh1Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010025.outbound.protection.outlook.com [52.101.228.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40456449EDF;
	Fri, 27 Feb 2026 15:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772207860; cv=fail; b=N60en+DJLrHP5Z/3lPxZFQpbZk6LJEJ3PB315zNyHma3X8qz0tJ/kQIaZYTLTYv7leXiODHQL3TYJNEgywuw/1FfupRSk8GL/M6RktW1xaY/18Gp+qDuo0tBgJNrOlMIo4LZVnbW9+C0hKuSyx7hfSgUM41qY9HZ0g5Oilpeol4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772207860; c=relaxed/simple;
	bh=tp69INLt2KM+x1CEBCT4m3ZJuUI01sVWNgRz+GuWu3E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IXZl6uvUxPPDddNAsXd1S3TO98kUduh6SkW4sX9RzdID94aN702LTDH0Pfs1lVQbvBuSK4iwGX0qzeP46k9Je2emEa78zMavM7xRQeGi7lNuHVb9gNM/+6ZrnscHjHZKZ9kVAfyEecSnwu83xDr2fv2e/C0DifoFTf7GUoAGDmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=qAOYAh1Z; arc=fail smtp.client-ip=52.101.228.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTQg/onMjHHcE773zEUMXXVOt9u52KGwYFNVi+VID2Gh0tU1Faq0+s9E6c72iRDZIMnLQJ+3dwYWiHlXXi9sssy6NqR/p06LVzM2IU1rS1tTIXuWjkJskG1n6uD4o9FLqSN5qvfcLcmewZjpL2B2Iyb+QjsCkkkw5XG78gnzRj3/eCCVFI8kTAOWI3Qvb0doHMUTMFXdPEEQztbqJ07mIohueAb7n8iC9UA7l7fcSC2iO47YtpD+5tQTN39mG1+JMMwW+jndf0tGOWmNtkwEEdcYK+orVDW9+tnAmR5nTJIAe0n/w7eUZ+daDBfgOO66nP/7RKIT0/2a+i9YgaP+hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u2QDg1zweJYlhhUmc+upPMoLC82tOePGpnB8zRcfAwg=;
 b=UmyEw90rFJa2ZuS/3m1hiE18rE0w2TRsDt6gEd40DM8TS9D6iRjhMIK8w8NLGzzMzICxLOlQcNDZucu9a+TNDNlXOYrTDNQJ2hCPOp6JSxVdsn4BPBAw8GbYflsQYJPwGmfgp2OtopTlIM8bDAfHJ6JZJFyzw1DdU9zSKSdDb9go30oLLgC4CfMLTQMC3enhK8woEJN+KhkwfkVGcQvW9cK0O6KpcnXW0+AGpRwAIfM8KEObRxW83DQNVFt2SCUQ5D5yqBh/Ly/BDynjPDTrDna3fw4dsZR69hubGYes9AXa7F4gPLPep2EZewH5hgWAqa2BzsU/SC0gz/l9hiHx5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u2QDg1zweJYlhhUmc+upPMoLC82tOePGpnB8zRcfAwg=;
 b=qAOYAh1Z/gVevzNGlgFKYT5YS5N8SeUyqDwMqX/kS28Xll1AmqlsK/5IK62kN5glt3PsEQGXnXOIYxYgDdsM6sA4fCzrl1jpkZu9/HoyRXNyybULDZvCOSM26MIjYacdqVYa6Uicl+BBwFVcwr7XDfMCFU/TZJeSLph9kLa6q+c=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12401.jpnprd01.prod.outlook.com (2603:1096:405:f9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 15:57:29 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 15:57:29 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Brian Masney <bmasney@redhat.com>, Chris Brandt <Chris.Brandt@renesas.com>
CC: geert <geert@linux-m68k.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 11/13] clk: renesas: rzg2l-cpg: drop determine_rate op and
 use CLK_ROUNDING_FW_MANAGED flag
Thread-Topic: [PATCH 11/13] clk: renesas: rzg2l-cpg: drop determine_rate op
 and use CLK_ROUNDING_FW_MANAGED flag
Thread-Index:
 AQHcp07a2hBuHvp1QU+n+sL4i/3plLWWNSeAgABwAgCAAAJagIAAAFuAgAAKfICAAACi0A==
Date: Fri, 27 Feb 2026 15:57:28 +0000
Message-ID:
 <TY3PR01MB1134626136D6AE06C9A699F798673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-11-4421dd2f6dc6@redhat.com>
 <CAMuHMdWPiy2OYEntYNEMjkxYPrQBED2segMfND+4VtzdeQE6+g@mail.gmail.com>
 <aaGxrm0SqwaJWCph@redhat.com>
 <CAMuHMdXR1T-VUnk87qpCmdkrYZr=UbjRJNznLw3YV98JAoN=hw@mail.gmail.com>
 <TY3PR01MB113460B83239C8251DD2FA39F8673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aaG8v-y9UqsgOZxy@redhat.com>
In-Reply-To: <aaG8v-y9UqsgOZxy@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12401:EE_
x-ms-office365-filtering-correlation-id: d93396fe-df00-4a0d-b28c-08de7618e8cc
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 xlgg01Afaux7g+jDi7c/DkqnUJO4O/icgcf4RH8bCjLxVuGEqTpUJEkOHWWQs1UgX6J865AtoreYiFIDYeh+Ix4RBBXXCE5cXtbHE7qcfvSuURWoYiBio+QkEha4ZhbttLEVEkvPhypg1OoogqUyfu8vnaItHhztGZ2hWWaekt5LAJmNTAaCYXt8P3KHDHfh7HU0ef7xn2L+gQa1WalWBDX4yJt7KiXWDBMsAxewdClHckdu3fZNQoXM8ocG5LhqxMKqTwDpOaucL8MFcnqLQJZMUKKS8cp4l1VqiDBMazaRYj8PPq/+TGPoQYKjy5gXI/nGznWbi4gVHt8a3Osk0d+Fyb9ZDrS87N7fYgiKaYmiVjAm2pn8UF9SrbF5knMGpP/cizTArx1LgTmUs2Q1MP1NqeTjxowyR9fb5UmHLCtUpRozCQwwUxaE70+srjDBww0kN2UBTL+nd39N4khQkiZ9eDrq8Qghvb1Inwkv3+kHOOyUte8Vv1vt2/+GAX4pF6G/8GGPHrxesq/LruTgRqc2GUeRPxARrp+IyzrlgIf7acH9mFuIO5kWAWewbasSgCX3fmWPREDDRB05GdE3H6yKTM3I505PbS2VKtnomuQU6T4uDPORxdxRsFT4ASzn03izZW2IqDjTNUqdisRM5uNG8i49v4YLcvtCTSim4RY0SFb4LlyNXz328tWbPrVEoWxEwStwsDdQDYLKWrxqRI0wk1k5TDi4lUdRudzCY7E=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?dzu9jMi5weXcX84qMm91Fq0YtipwtG4R2gOLZzP5jgipGl2OLo8xCaQKpilZ?=
 =?us-ascii?Q?j7hBN43tYrd1jQpXXfatmVN2DgDuvRg37DC5k3Oh5keHgaQZ0sww/eANzZNM?=
 =?us-ascii?Q?ZlEE4i08MusWmwf+H4uqgDQxTKKRfVJ57y4yJTEeb0cJR7Znb+36jrS0Pj7u?=
 =?us-ascii?Q?wHiI3EcuTq0BYK9n0VF4TssSR5jtDKE03FB+3FbZg6+FsZFM83dN2AGpDMOw?=
 =?us-ascii?Q?uUhS1HRRWFgNQFLGZ90uhDRjlC8oOo5SKRGa7bRgGTBVP7QY+3azMu6S2t0E?=
 =?us-ascii?Q?I8GIglSTyPJksF0KRroJEHLzNZCPrROee0PKTS5R2bv38MnJZrWHyOzIIA0R?=
 =?us-ascii?Q?vw3mRXF927rQcEffTOKVNqbnbdfur7bYlHLj1kivDPKbD/Z+15JpGyxvziLr?=
 =?us-ascii?Q?rSU3N9LMSY7GNB5+7v/H2fjESYuYxeZ/0RGbQPF/xr3DLeGl0jguBNN/YRcC?=
 =?us-ascii?Q?Beze09MmU1FoQGzHA+YXUg9mTgSDRHHOMTti/5EL23dcnm+Zflg38jW3C1fj?=
 =?us-ascii?Q?wus8xOQDffYZm0v4MuvHumKzDWRejjq5Cd/0IagWfJdstjhYv8w3jIvMVkGb?=
 =?us-ascii?Q?AX1mFV9ndCKJSA8yi/dJ/GbUzbWZxGm1NN/1u4hpY8kB/C2nKJVw28GLT7fN?=
 =?us-ascii?Q?pPPYk5s9Y6LsZMKntlkm2MgjDpkRm1iSlF70poqDL1eqYqxFnZytftPZtJRd?=
 =?us-ascii?Q?uBwHr2rqgR82hXJHnS2HqLBbW6vTsLmYmXcHcAga44Wt571GjACRZYqqiGFT?=
 =?us-ascii?Q?YEptcIBbKfacTCFGJ8A3piAj5O7lClHNNrfAhUexGNqZyiKkYxo890IPeSVq?=
 =?us-ascii?Q?4TjSR1LqmeUC6tjpuQ1vKmpuhpAq6xNQS9UnVg7nNBmOtc7lETDS+gLxM3+a?=
 =?us-ascii?Q?UdF+sTiv2yar5ivLJa9c22vrfAOzaf3KYSt6zm4ydQjOJ9y3kjl+ybyEakwt?=
 =?us-ascii?Q?Lo1D3EAdSh9/5+xqElbCaDcS4EkIC0W9+aPVDkJqw5cHVjHUhcu+/NDreICc?=
 =?us-ascii?Q?XTvuojea8HZHSjfFCPoozeFozSQjPaYa91t+k0r6cAXedmNc9q5h2th2o73d?=
 =?us-ascii?Q?28HiJjZK9xjZ9xC/1GFCP/lIMtCKbFwUJWEzK/SgEjCdmKVroEMcQ1xHXquZ?=
 =?us-ascii?Q?WtP1P2jV1uClR0jrAz6gk8tf1t+Q1gh4uJFyqd1/iOZBHMDm0z/FebN3XyXK?=
 =?us-ascii?Q?rV98fb17fdSnigI5Lt5nGtEWFIEstEo8ODT5NhDcq5EVbtiMPzVcZaphpb2R?=
 =?us-ascii?Q?A9yeVUyeBoTE8i6M37whJsFi7OOQnIhf2xMYoioIK0MJ+HkZ0xJhFZ1FlTMV?=
 =?us-ascii?Q?+O4GruAWOVqg6ph+jWCvvqkVab+DcsQGXoDbCyxnz+Iq+n7bCQMoUuD5+hpM?=
 =?us-ascii?Q?K1JtgU7VKz3SgSqdiCi0wwMxpSK91F+ycQ7cPFLcpikwAYcYfLG++FWC611V?=
 =?us-ascii?Q?Wcb0lWktBj1W4QEp5qKywQD4UuuY6irJ8qdvVcOUQLXM+nTPJk7fItR4WKEH?=
 =?us-ascii?Q?BQzFTLHcDy4WXzXxajRrMYIKgx+hBD4JLLnP5He/PDbXSIbyaml/8Tp8IXp6?=
 =?us-ascii?Q?S8p4AMZdWStO1r0Yxn0tAg9z7UfRFmZWVbIuZX59xu+NtyZiQu3+q94qVNhv?=
 =?us-ascii?Q?pW7ovwGeXmncPJXZWUGaU8RgCwUK8awXp71zsB+WTUcMeNg23jzeslE1+VF1?=
 =?us-ascii?Q?pAUVi8IxZ1BiPSlqXbZkVTaIw/wBVnVeqtUlOQ2/Vdbi/k6iJM/MRraVazOg?=
 =?us-ascii?Q?UfYPSpJWXQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d93396fe-df00-4a0d-b28c-08de7618e8cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2026 15:57:28.9863
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f6AcyO7XCsT+rqD2pSvcFUr4KWDv9Kkc7uM1jS5xGL1lw+ZM5eDaqbFkA7lyDEr/p76qAzVHLNnK9pvPTEazk6L/KB6UAijlf2iBW674t5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12401
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-28578-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[bp.renesas.com:query timed out,init.name:query timed out];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[bmasney.redhat.com:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:dkim,linux-m68k.org:email,init.name:url]
X-Rspamd-Queue-Id: 2F1EF1BA762
X-Rspamd-Action: no action

Hi Brian,

> -----Original Message-----
> From: Brian Masney <bmasney@redhat.com>
> Sent: 27 February 2026 15:48
> Subject: Re: [PATCH 11/13] clk: renesas: rzg2l-cpg: drop determine_rate o=
p and use
> CLK_ROUNDING_FW_MANAGED flag
>=20
> Hi Biju,
>=20
> On Fri, Feb 27, 2026 at 03:23:19PM +0000, Biju Das wrote:
> > > -----Original Message-----
> > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Sent: 27 February 2026 15:09
> > > Subject: Re: [PATCH 11/13] clk: renesas: rzg2l-cpg: drop
> > > determine_rate op and use CLK_ROUNDING_FW_MANAGED flag
> > >
> > > On Fri, 27 Feb 2026 at 16:01, Brian Masney <bmasney@redhat.com> wrote=
:
> > > > On Fri, Feb 27, 2026 at 09:20:09AM +0100, Geert Uytterhoeven wrote:
> > > > > On Thu, 26 Feb 2026 at 19:18, Brian Masney <bmasney@redhat.com> w=
rote:
> > > > > > This clk driver has a noop determine_rate clk op. Drop this
> > > > > > empty function, and enable the CLK_ROUNDING_FW_MANAGED flag.
> > > > > >
> > > > > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > > > >
> > > > > Thanks for your patch!
> > > > >
> > > > > > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > > > > > +++ b/drivers/clk/renesas/rzg2l-cpg.c
> > >
> > > > > > @@ -1041,7 +1034,7 @@ rzg2l_cpg_sipll5_register(const struct cp=
g_core_clk *core,
> > > > > >         init.name =3D core->name;
> > > > > >         parent_name =3D __clk_get_name(parent);
> > > > > >         init.ops =3D &rzg2l_cpg_sipll5_ops;
> > > > > > -       init.flags =3D 0;
> > > > > > +       init.flags =3D CLK_ROUNDING_FW_MANAGED;
> > > > >
> > > > > Iff this is the Right Thing To Do (TM), it needs a comment, as
> > > > > this clock is not managed by firmware.
> > > >
> > > > Before I start a larger discussion on patch 1 with more people
> > > > about a name for this flag, help me understand why this provider
> > > > has a noop determine rate. Is the hardware eventually programmed
> > > > with a rate that's close enough to what was passed in? Or it
> > > > doesn't really matter what the clock rate is, just as long as it
> > > > is running? Or should the determine_rate function be filled out in =
this particular case?
> > >
> > > I'd like to defer to Biju, who added the empty round^Wdetermine rate =
function.
> >
> > PLL is capable of generating any frequency. that is the reason.
> >
> > But we could, call rzg2l_cpg_get_foutpostdiv_rate() from
> > determine_rate() as modified rzg2l_cpg_get_foutpostdiv_rate()[1] can
> > return errors
> >
> > [1]
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tr
> > ee/drivers/clk/renesas/rzg2l-cpg.c?h=3Dnext-20260227#n590
>=20
> OK. So how do you all want to proceed here?
>=20
> Do you want to fill out the determine rate in this driver? If so, we can =
just drop this particular
> patch from this series.

We plan to fill out the determine rate later, as it can return error.

>=20
> Since the PLL is capable of any frequency, do you want to keep the empty =
determine rate functionality?
> If so, we could use a different name for this flag. Maybe CLK_ROUNDING_NO=
OP?

I guess, maybe we could use CLK_ROUNDING_NOOP, till we have proper .determi=
ne_rate() for this driver???

Cheers,
Biju

