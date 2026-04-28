Return-Path: <linux-renesas-soc+bounces-31697-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAqNBFCJ8GloUgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31697-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 12:17:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 970C6482725
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 12:17:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 311E1301E3FE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 09:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD0B3D6465;
	Tue, 28 Apr 2026 09:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="S5gXnYvm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011042.outbound.protection.outlook.com [40.107.74.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9EE3AD53B;
	Tue, 28 Apr 2026 09:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777369095; cv=fail; b=ZySE7xQg+g0Ep8LBzeh2L8f1ZGNOrnLNYMYzxGWxTcaH+IWv5eEBEZJV+BtzwesZ706dlRR+CMOsJha8Wb79EzMSAX+syLvt4WhMLdL/cCUpbvkmcU1SfkObRX4u/Z8utyqSkP+zSVaWF3drVQ7/MI+ilyxGU7SLJKmeC1Q0Ga8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777369095; c=relaxed/simple;
	bh=INTc5t3pwSpMAgKMG20K8tcrEc8eK0cQ4K0cUr5hTAw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IOuHf8E3I6SXokaQWM/PR76Q017JuPszdBy1GBRQPP96uCFw/BQtbJvRpdkTSemthqJfN43H2Oz/wErLF8bq3OqhRQgyHxcSaaOaHuTgMKFhbMB2FPuLrE+PGavFKLBohwg0Xp9NS8eHbPQUM3imkDh1lQo0nFYV6cxZlUwjAR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=S5gXnYvm; arc=fail smtp.client-ip=40.107.74.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2hltnEUL24tSBFpZBN7S/DRQFw2oXUrWVZAeegIz1FpwTDjCRwyMLw9YMVU5xpl/0wURiFCsclwhaVgNw3XxjnN3XCK0Ik3PxvUGON7VlT4x9C8hp4i8014Y+TghHYifabJcvV1PSP1yrQNzg92rp7Hz26pRV7QXDnbrJCgeicYopBBKu+kQk9oBgtfsFuVlglE0//hxJRyfqSovk2ivshBDItCEEFz+TeJnmIGeygsOk2KsqG45NJgmLb2UegFZM4A/q6uPCsZYmpw7F9zmRm3S/Lb5kfyDTNcGN2zLC5M8NwZPLo8OD5mWW4wwbx8I383zzpwCFj02jyiZP0VkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0aab/yJ5hAAWAq1keJLAltF8KYjaSaEyM+iThRrEyM=;
 b=bEZ+z4QrQVCEL1JlXKagxADBwDJ8zFLmEN47REI/tKEbbocLcSG8/U514rPs8vdRPMP1WSVGuih6CXp1PuMChpL5o0jnKNh0TwdKI2AFyf0omfwFS0+jMYrLOJYV5yUKa4OnhtvHtLtFH8lPmvyBHFl7Q3Wa+1Ebl7fPTCfXfP02N2ZYxvjnVwkpoS8QOpoNz44VAkuVLugv+JfYNXlJFztmOd4bYT9ychUYtCRlNc9xBzgi8ZqmKoYeuvyprFNBsgRfJ/GwW2MdGdZRGaptud01djYvS1yue7xQjSeMUHMBfii30mLzR5pych3mU3TWe9IcB2b9wxG97DawS25/jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0aab/yJ5hAAWAq1keJLAltF8KYjaSaEyM+iThRrEyM=;
 b=S5gXnYvmMwZrvpJK3xkKbkjUkiT+9xtqMB651J1oAwXsNTcOHbr7aEkCJ4tRK+G+4NwQAPBIp4HTLXpzGVn6iw3Sr9bKqaCUmxcCuErETCVoxLCENiup7BTtsBGhKFvL2/xgQ4eDY/cmLi4Y/SKD7DcO6NFSDYVQhf+FknGIGWo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB6595.jpnprd01.prod.outlook.com (2603:1096:604:109::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 09:38:06 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 09:38:06 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, "vkoul@kernel.org"
	<vkoul@kernel.org>, "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>
CC: "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] phy: renesas: phy-rzg3e-usb3: Fix runtime PM underflow
 during suspend
Thread-Topic: [PATCH] phy: renesas: phy-rzg3e-usb3: Fix runtime PM underflow
 during suspend
Thread-Index: AQHc1n6/R7hZJapUgEme8pFZ2/rXrrXz+kOQgAA5gICAAANPoA==
Date: Tue, 28 Apr 2026 09:38:05 +0000
Message-ID:
 <TY3PR01MB1134627FCEBE0C8692295339D86372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260427194741.161533-1-ovidiu.panait.rb@renesas.com>
 <TY3PR01MB11346819FE6253E90C7B4F88486372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY7P301MB198432F1681EFA444D16F824D3372@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
In-Reply-To:
 <TY7P301MB198432F1681EFA444D16F824D3372@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB6595:EE_
x-ms-office365-filtering-correlation-id: 7af7a716-9517-410b-8a94-08dea509d9c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 AbGxkyRO3OFqAnOZUdKOQxIm1z/IC7djedgJrl6W+3e4EQDufWOcdZn0oi3Jq6HP08OJj5fYGKXIPIMXQcr1MLEkoh0slfi1wBlRU8q+PL6udXT/bkUHWSdDKb9+cuiN5Kkd1H1VWwtQQUGeprPO6Eda7TZeEq426yewKWgbIaO3ZewjFVImkHhGM6yZmE0+SolTdrr/5rtWFF+0CM1SjKxHvXdz8I93SowUeZHn3ExoMLZ8WLvm8htZ8HXS+v7cbIN6NswNXM3O152LXvcbAk6nEQOqbL4xu0wv2rWbRZSFPaiLlrBgXkRYaNZlJQ0EPb8LO4AG0JOSJEADEM5CKqU71HCENRsgmmQjBBcENyJzlBvhX+FaKKl2PHWboalrgpW+onYBWXdVE29HWHzDxQxjQblvjdhoqQ182+y38QYLw0kuZMuqWKS9o9O6Vxe9FpuNMl/AIZ8Ji2F0fwjZ//Q0d+MbKScDxTFWRDqsTIAN62EEFgIiWwFJK6gCwY1bZxjTOb736RTxhi/rKbwrkUEudQI6FDGIrpxosHbQa+IdgYAJeqtsrJNJaKjmLLTP70/NpjRBGqNyJT15Te+Wfzhbx0mUQU7+NAfO51IjST5sxi6KiQ5G4oaj6xbAgG8oIh4sDjCLO63OV8ZxyUt4f2HekW27xW7unxALD20MmtpneXck5oNJ/wqUXjqdO4YMpVZMnEwQICcS6b7lmrtFZXXc6qW8ha6YcJ5rpw62dsdsrI5PasaPBVAptEZr5Fxf
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4d/1BjmFonMtTXZDzP2oNr4pJesz4eyERIDuxgR5UjmimiCryaUdIPY8UNyi?=
 =?us-ascii?Q?DXQ1JxVx/RXgTgLCNeto9gewrxj9Sn9z5r2tTMCdlXplnSh8NzDPe0lgeOT9?=
 =?us-ascii?Q?P1ldPTIjrVA7aowxWXJCQFcoXaLYLzva7hAZckmbMW7+uWGU9xQt3FNE6Sew?=
 =?us-ascii?Q?9vTamos66KcuvN28otQS18FXfIbeKicfttH3U3sy32Ef1kk+O9K4DLH88hjU?=
 =?us-ascii?Q?5nRELM6RAZ5xGHpvVz6yY6mSkd9gtpy33gfHcpPBF2xa+UMiAA9aeCkJP2xz?=
 =?us-ascii?Q?9H81mp2kyL5Xwcyf5FEVVRglI3FSWSy+wcS28uqlw7d0yAd4h+2DJyORjatm?=
 =?us-ascii?Q?4nbIuT/nfYpu8f1c4OMniETQnpQSENd7UEaLhqU7dkRJBeO6HFnRJYpI71/w?=
 =?us-ascii?Q?o3KvgLTAHUQTFk4axwEDMxeH2KioOupAvbUFE91nfLfak6cMvl92PLIEfU/h?=
 =?us-ascii?Q?OCAnvlA4hb44WxCOnWgc4EsHD4181fku5k8eyyjOvpuOuAPDNOpQPv6Lb3A/?=
 =?us-ascii?Q?kgJG1bT5Y71vtu8eBEcaxQ5DgOCqvjftSk+8imkYwKQIzUNPeMzMomNW7c/W?=
 =?us-ascii?Q?m63UAFwwafOJmQilo1Ksdh5ople1x1f3U3BsAd8y01d1/ryJyt0gMYAQFVV0?=
 =?us-ascii?Q?SUUB6rZhujisREm6Z7zhpxzW5f07G0wPn3L86RekFi31hXCyy0/vdiH5kHCQ?=
 =?us-ascii?Q?Y3gFHv7HklBEwzZC1jGXpUwGGBmAIfO2a2ON/Buj9OyKt9z/EDwAeEV3DJIy?=
 =?us-ascii?Q?NuweUwJjeWLUe1FrKlRyKrUohiIWrhdatTsCBR79H7N6ueAdfR6LiAw939y0?=
 =?us-ascii?Q?NrWzvlp5/UETKJGkVLOYUf8mfJmr1TUCerA0Dcqe0uERWuQh0HVYNPBbXRDc?=
 =?us-ascii?Q?c7d90MH1TcNKf1JG4GZWZmpwbkYQuFwL9WTYi4k7LhgNNebX8gvDpZzeHGva?=
 =?us-ascii?Q?GDsxejPlw5FlDaE5UiyLGfvkNL3/1heXb8p1MdjOS2ZTigNcwW1aQwlwAEY+?=
 =?us-ascii?Q?5tqW/8QjWuvbB4hTwZEIS80YjLjp48YC9WUAx4Iqqk0MglrVj9aP9BvGXIO/?=
 =?us-ascii?Q?2GwByWKyXKKHBYtgc03vwNdKFjGkzzaOiuBYrfP9ShoqoZQztxub0T7ratXj?=
 =?us-ascii?Q?Fp2l/SiIF9Fo6yKpyyvN3KRmLTHLzGobBQ04WPifDnlDpnv1nTHPwhd/FQzV?=
 =?us-ascii?Q?1uKId5K6IcSUNVyO77r2vtO36xzH7b/lBjzHtrr0vAMWjwRTcFV0k1V24sUN?=
 =?us-ascii?Q?petHFKGOqLYS1NIOjCsW4ZzVCP4jYF+9HMuhfdFVtnNqm9pnLXkvZrWGGRYf?=
 =?us-ascii?Q?5fvmPldUhr16n0lI9aIT7Aaam5q0dlJsHeb7LcQS234dQTZQtnIGBQ6TKfv4?=
 =?us-ascii?Q?VBZEQQL9G936xShaH+1gGib2e+7LmMlKtCzWPTDBm2Bontra54t3oaDohec2?=
 =?us-ascii?Q?EYxgn07P4LtU5fS7TgFzEOkmSVWi1FJBfJt6Hixh98vK21K4Cpc05mMIat/4?=
 =?us-ascii?Q?u4pMVeoAgvHh42zxSJUK7HOJ7bSRtiopDwoaIUHGxP82IIsbj8UGFVC9/cBW?=
 =?us-ascii?Q?amB4+HWX7dKqa8P2EVK/hnHOI2KFjh3hL6sKMlx/b0Fg0r2VNNSzG9WP9uVO?=
 =?us-ascii?Q?QSoxzaNsVCW/gmw3oZ2XFh5lSc/Ouqr8QMS5qjC6xLISgTZT9m5TIb/uUvSF?=
 =?us-ascii?Q?jU0thw+TpPfGyEZK81ayaklDWURsDx/xD3t3qfZF4pa7zAxAFeg7bbd+fHU3?=
 =?us-ascii?Q?T6gNY+3CTg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af7a716-9517-410b-8a94-08dea509d9c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 09:38:05.9706
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i94xZPD8su2xMrTFBoHIcfSEbTo4tZCm82eiZf7nwE1MMd2MQer8Y4wqF7Ii2ypYLsxU9rRUP84mqiZQPasu51vWayQT+k+fRqPaL3MSDbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6595
X-Rspamd-Queue-Id: 970C6482725
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31697-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]

Hi Ovidiu,

> -----Original Message-----
> From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> Sent: 28 April 2026 10:21
> Subject: RE: [PATCH] phy: renesas: phy-rzg3e-usb3: Fix runtime PM underfl=
ow during suspend
>=20
> Hi Biju,
>=20
> >
> > Hi Ovidiu,
> >
> > Thanks for the patch
> >
> > > -----Original Message-----
> > > From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > > Sent: 27 April 2026 20:48
> > > Subject: [PATCH] phy: renesas: phy-rzg3e-usb3: Fix runtime PM
> > > underflow
> > during suspend
> > >
> > > On the Renesas RZ/V2H platform, if the xhcd driver is unbound and
> > > the
> > system is suspended afterwards, a
> > > PM underflow error will occur:
> > >
> > >  # echo 15850000.usb >
> > > /sys/bus/platform/drivers/xhci-renesas-hcd/unbind
> > >  # systemctl suspend
> > >  15870000.usb-phy: PM: dpm_run_callback(): genpd_resume_noirq
> > > returns -
> > 13
> > >  15870000.usb-phy: PM: failed to resume noirq: error -13
> > >  15870000.usb-phy: Runtime PM usage count underflow!
> > >
> > > Since the PHY framework is managing the runtime PM of the PHY via
> > phy_power_on()/phy_power_off(), there
> > > is no need for the PHY driver to manipulate the runtime PM state
> > > during
> > suspend.
> > >
> > > To fix this, remove the runtime PM calls from the suspend/resume
> > > paths
> > and add a get/put pair inside
> > > rzg3e_phy_usb3_init_helper() to make sure the clock is enabled
> > > during
> > init, even when there is no
> > > consumer for the PHY.
> > >
> > > Also, change the suspend ops from NOIRQ_SYSTEM_SLEEP_PM_OPS to
> > SYSTEM_SLEEP_PM_OPS because runtime PM
> > > is disabled during the noirq phase and pm_runtime_resume_and_get()
> > > would
> > not actually enable the device
> > > clock.
> > >
> > > Fixes: ee5f1a3f90a4 ("phy: renesas: Add Renesas RZ/G3E USB3.0 PHY
> > driver")
> > > Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > > ---
> > >  drivers/phy/renesas/phy-rzg3e-usb3.c | 31
> > > ++++++++++++++++------------
> > >  1 file changed, 18 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/phy/renesas/phy-rzg3e-usb3.c
> > b/drivers/phy/renesas/phy-rzg3e-usb3.c
> > > index 6b3453ea0004..055775e1a0f7 100644
> > > --- a/drivers/phy/renesas/phy-rzg3e-usb3.c
> > > +++ b/drivers/phy/renesas/phy-rzg3e-usb3.c
> > > @@ -64,6 +64,7 @@
> > >  #define USB3_TEST_LANECONFIG0_DEFAULT		(0xd)
> > >
> > >  struct rz_usb3 {
> > > +	struct device *dev;
> >
> > Do you need dev as struct phy has dev member [1]?
> >
> > [1]
> > https://elixir.bootlin.com/linux/v6.0-
> > rc4/source/include/linux/phy/phy.h#L153
> >
> > >  	void __iomem *base;
> > >  	struct reset_control *rstc;
> > >  	bool skip_reinit;
> > > @@ -130,11 +131,21 @@ static int rzg3e_phy_usb3test_phy_init(void
> > __iomem *base)
> > >  	return 0;
> > >  }
> > >
> > > -static int rzg3e_phy_usb3_init_helper(void __iomem *base)
> >
> > you can add one more function parameter dev here.
> >
> > static int rzg3e_phy_usb3_init_helper(struct device *dev, void __iomem
> > *base)
> >
> > > +static int rzg3e_phy_usb3_init_helper(struct rz_usb3 *r)
> > >  {
> > > -	rzg3e_phy_usb2test_phy_init(base);
> > > +	int ret;
> > > +
> > > +	ret =3D pm_runtime_resume_and_get(r->dev);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	rzg3e_phy_usb2test_phy_init(r->base);
> > >
> > > -	return rzg3e_phy_usb3test_phy_init(base);
> > > +	ret =3D rzg3e_phy_usb3test_phy_init(r->base);
> > > +
> > > +	pm_runtime_put_sync(r->dev);
> > > +
> > > +	return ret;
> > >  }
> > >
> > >  static int rzg3e_phy_usb3_init(struct phy *p) @@ -143,7 +154,7 @@
> > static int
> > > rzg3e_phy_usb3_init(struct phy *p)
> > >  	int ret =3D 0;
> > >
> > >  	if (!r->skip_reinit)
> > > -		ret =3D rzg3e_phy_usb3_init_helper(r->base);
> > > +		ret =3D rzg3e_phy_usb3_init_helper(r);
> >
> > ret =3D rzg3e_phy_usb3_init_helper(&p->dev, r->base);
> >
> > >
> > >  	return ret;
> > >  }
> > > @@ -187,6 +198,7 @@ static int rzg3e_phy_usb3_probe(struct
> > platform_device *pdev)
> > >
> > >  	platform_set_drvdata(pdev, r);
> >
> > >  	phy_set_drvdata(phy, r);
> > > +	r->dev =3D dev;
> >
> > Drop this.
> >
> > >
> > >  	provider =3D devm_of_phy_provider_register(dev, of_phy_simple_xlate=
);
> > >  	if (IS_ERR(provider))
> > > @@ -199,7 +211,6 @@ static int rzg3e_phy_usb3_suspend(struct device
> > *dev)  {
> > >  	struct rz_usb3 *r =3D dev_get_drvdata(dev);
> > >
> > > -	pm_runtime_put(dev);
> > >  	reset_control_assert(r->rstc);
> > >  	r->skip_reinit =3D false;
> > >
> > > @@ -215,27 +226,21 @@ static int rzg3e_phy_usb3_resume(struct device
> > *dev)
> > >  	if (ret)
> > >  		return ret;
> > >
> > > -	ret =3D pm_runtime_resume_and_get(dev);
> > > +	ret =3D rzg3e_phy_usb3_init_helper(r);
> >
> > 	ret =3D rzg3e_phy_usb3_init_helper(dev, r->base);
>=20
> "dev" is the platform device, which is different from phy->dev. Phy->dev =
is a child of the platform
> device.

You are correct. I missed that.

>=20
> We could be referencing the platform device from phy->dev with &phy->dev.=
parent, but I don't think that
> will make the code cleaner.

Thought of avoiding another global variable that saves 4 bytes.

Changing "&phy->dev"->""&phy->dev.parent" is not making the code cleaner
then leave as it is.

Cheers,
Biju



