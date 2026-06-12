Return-Path: <linux-renesas-soc+bounces-33916-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4IvyIxniK2r0GwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33916-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 12:40:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7475678BD1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 12:40:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b="mEo/b372";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33916-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33916-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D59EA304D7C5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 10:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF60392823;
	Fri, 12 Jun 2026 10:40:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010052.outbound.protection.outlook.com [52.101.229.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B0636F91F;
	Fri, 12 Jun 2026 10:40:16 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781260818; cv=fail; b=EfWOwbAIscqdhXHYjvbstZfus1GkRQxP6g+5K/0ytIkEgUtri4rxLPdNqPGZoLgf745q3Q4ZpcbNYjgyLbF9hNu9LaR7Uki/9Xbao0IiYjTe/hIvCveDTPljJxPKJAHKu/DLgUcEUQt7HBQb5MP+bQu07AXT3IJYkIp21Bzb800=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781260818; c=relaxed/simple;
	bh=sPVNteAiD3W3vQa8OkSFVjOuIPJBBSPBGGecic/KKb0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gzoEz+KEPU222HibLtaz7aL44YBDYwEY5+0uosIHD4rcfbzW0Arc+SH6wJn6Be7DtEyQJWilsI80ZOt26gXQoPPhEtjtAdrgBeMR9Kz3eQ9xxMciFodsV0lRgLsWWo2QcnqGj+66Edsl7ZkR3fswlU+/WTVRNDYrXT/Bq41PxSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=mEo/b372; arc=fail smtp.client-ip=52.101.229.52
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z5IASiyfQiOJOzdb5d0EvBGIanYsaFZCPnevKiJRKl4Zzz4X7r7AgOIPTBLO4JCkFj8yw8xIq5x9MO68fAmDy/Sb7POy9uV+Es3A9Nr4ubxLXUY0v3TeuB7K5tyOnx0vRKDGS9GrTKqTBM/QZc+rGfAoiB3Yqt/8bp9DmJmO145PDDMYw/KqKoejGCRuae+cBcAlF1sBkjXPXxXJTQv5o023T3zRskGVVrW80Pg7BJOUzG9PIHpraOBaCLDKft3XuYlNugexZOjatQ3l3z+jvbNsHnboOMzXrIzd43BtujHhrwyFUc5VVCkNiv0RJU428hJsfBZf728Efa4p1BO1Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=feGGCptLAr5DW+P/2+JXQ7PuksyXGh9gyDXAa12WCKw=;
 b=LBCLnKPmGee+aURg8P6EFQ1ajJ05ENhdU8SeoG7+q+BKM36LzYLDOzVUUZCx4nlQs9MP/NVF8pkfhmDs4VxF4inlo1YcxAzu/bvPlinNqcBIKpUPqyiKGX6fPeYzyff5aWFhZxbuH3C3qiSQ1GhFCKXX6Vy45Ed3IYNBkh9U3V1x0DDH5sR0UgjamF5hlfffLPLay1iVFj2cCDcIAU/5jAeui3a6wGYkndr7kSwoDY3tGa7xssl04DSrd1DT3c4Sp1QNisXlfWhurOiBe4gcoVezovXXXAoXIy8ZTnnV5CQPHrPsh3aE6CCowUtpmUVhKt7Ss/c1QUX2baLxQNsnaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=feGGCptLAr5DW+P/2+JXQ7PuksyXGh9gyDXAa12WCKw=;
 b=mEo/b372JHqsS/dpfVuVL+aZINeyq2fBxSFaMgnQ/Lc4zZiJKM5infrgYIqYdVEvTB2Agr2zMrc8RSwrQAuUEsCQcJSxOe4eWuVTZbsXomD9MLH6CIIT7EfRoqUAvpNLbVk1KQ3vO4D0FS+gntslivXz/lpSx7mPsyUHXU7FZ8Q=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OSCPR01MB13411.jpnprd01.prod.outlook.com (2603:1096:604:32d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Fri, 12 Jun
 2026 10:40:11 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0092.016; Fri, 12 Jun 2026
 10:40:11 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH v5 2/4] arm64: dts: renesas: rzg3e-smarc-som: Add Versa3
 clock generator
Thread-Topic: [PATCH v5 2/4] arm64: dts: renesas: rzg3e-smarc-som: Add Versa3
 clock generator
Thread-Index: AQHc+K1oWv2WPrhoVUKv/Ec4+yIF4LY3cNCAgANMdGA=
Date: Fri, 12 Jun 2026 10:40:10 +0000
Message-ID:
 <TY6PR01MB173776ECE5EFE874F031C5733FF182@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260610074702.1743334-1-john.madieu.xa@bp.renesas.com>
 <20260610074702.1743334-3-john.madieu.xa@bp.renesas.com>
 <TY3PR01MB113467A63C78C21DDA14220BE861A2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB113467A63C78C21DDA14220BE861A2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|OSCPR01MB13411:EE_
x-ms-office365-filtering-correlation-id: f8543f17-9b97-4dec-b71c-08dec86efa9f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|4143699003|56012099006|5023799004|3023799007|11063799006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 CtEBJ1KKqUYe4E5aXV2MNfA4eNm4zSah201FzWgQlMQ2Q7QyVO2IZo2VxZSKy/CT7JAKX8cYSrXe/IpLMQUSDTXa1HV+R90TyaO/V2B/Jawdbpt9L1iZAHvmkbaPZ3i+SVATBKpkyyG3mD+qXUXPdetiIjDNxyCZor/1jKF34eKfvWHdkt3lwtVweGazuKuF6qqh3Vo5Qyms19Mj/FpU5SbXBD6zpXuTx3oKKmbT9JrpsdN74pV3NnaI3h/WyfnPaG4MBwNXSe231XYzr+L2kWepukbtDU+YlssaeTQpMElniHYuYSwgAUoRNUweHOHe/3d+QqHeRz54I4333U3vk+SnAGfdql5wxlxp3XRRP1KCK1oJwfg2AFgLwcR0lltzopqrrJ9YEvjFJeVM3oUS2Tjhty173tUZRPVjJ7jEbbRm5pI/s4R9Tfm9BzDaGaMOI9egkfr/Nh7IFacOl747bQsPM2KFsRmUyKLGCd2KpkL4/W56g7Jz7mEFBXmy/nTPIZS2zqJG4sZfoBD7f1+mduJVnWUWE5Y59tlkoWBtm693tMyULLiL4kEeSxmTX92iZNXgyHwqjnxvn2QmlKp5f96i9iqc3kGhT19LYbCwbQkBXzwHhvysOkqSVXZoUND/mMgqH72mh990motZY/KyRRtJ+Plls853ahh+TABpbEkC4ZJ9Huvk3gGE187A0QGgHuxMEwD1IKwhpGgWsOVCpq+hC1kvW0l2m454wzPhIQyrLw10SjfAIXeepf0Bq49C
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(4143699003)(56012099006)(5023799004)(3023799007)(11063799006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Dmex4Kz7LlLtZUb4S7Te0Hih88zE1l4cCC04O9rnfY7ibZscrMaENl+vQncH?=
 =?us-ascii?Q?o6WsQYTk99KACvT4jI0OKX+oiYMDJzUvfCN+KQegQ5g5aDvFdFpd8n4d/hk7?=
 =?us-ascii?Q?CgD6R+BZheJbu6rIURTn4O1MVKVWyb2kdKZwDUAtie3Gk27HLm5drpO9rlaX?=
 =?us-ascii?Q?ZFunPlCocrPtcfQCrodbB6N1rlGH2116UOp/4CHQX/CDGH45QtwADNtWnpBq?=
 =?us-ascii?Q?k5F/83X+utdidy1Hk3iYtc2n+r3gFPVbb4zPTplY4bvB84omWMOmU/xS5533?=
 =?us-ascii?Q?bEYEzPSevuWWeo2eJ1gBReA2aiSxtzMz0YxX8ua9JFqnK409E2+uexvAbZji?=
 =?us-ascii?Q?Gq0RrAk3gjoqRjINdnnzpaFMLlqSVlIU31pON/EVvxEc8A7BNT2rmMfLkBIB?=
 =?us-ascii?Q?+NvopitV8K4DMMZAR2ogV9aQodv0oDjqLqFZ1TG46n4XouvK99l4KvuImmn4?=
 =?us-ascii?Q?ZT1YUJdB7iN0WE8b2DBZpJ+5ciM/4Ou0cEPdK9DakEiWVaEb04rSyWlj1LKc?=
 =?us-ascii?Q?uCOvlU6hAV1SkU1naQYoMNe6eL/VhoH+upseSrXIBFWYX12Av+utSQ/M5nye?=
 =?us-ascii?Q?bRsaZToeqJ2EgDZgM9KQypJYcfj5dJHpLvUKsXqiYdv2SCkp+fQ1aOZ0i4B9?=
 =?us-ascii?Q?FYsLwfSO7WH5/lyrU/tdzoP1LYK7DqhDqUMxU4itsx3ha7kpcorareyv1hsE?=
 =?us-ascii?Q?cJR5wm2n3omI3eYXpHo6LZvIrP7fkKZrrZvR3kd2/2xtqp7e4QdM5nnXjc4X?=
 =?us-ascii?Q?LH14t0Gd6HqNhzGfA8Fc6a1nXe5vCNRZRzckqfBMcz5qKPK2Mi+no6bRuMSY?=
 =?us-ascii?Q?h4yOURn1crDJd6L7sY5595DEvou6GgHIIvKPLfCMy+rS6U25NvNH18nGOl3D?=
 =?us-ascii?Q?mN+A55B2MVawV/Y4LIY52MHKPK1k3Kky+U4elG4f0cba9jb45ksZKYnRodzD?=
 =?us-ascii?Q?dmO61TkL/rHrWHll9+K7oJTjvUp7+DJF7wQzam3gZGcd1EyVjqoak9DzIWCD?=
 =?us-ascii?Q?YcWHdrNf1LL0DjA3QATmv26Hl/H17g45NNvrHOBQVIXXvcPvLvc67FR27LFC?=
 =?us-ascii?Q?kaWh/hpCkf15V1kntwAQo9jh1Gps0RempxarWrjhDj+uDZ6AH4wWioaEUNWB?=
 =?us-ascii?Q?hwhxnCD8XxeXAXZpoBPTjKEA2hY9RqkLo0uNM7jMhEuXyBMSeDFg1+I0CT6T?=
 =?us-ascii?Q?oCbQsJKL01J8mTNdqU/5RlQUx6B7zOTRuYYu3xvi/JtMJSiP7sSTcSLXC72X?=
 =?us-ascii?Q?Loi1fvbfkLdcQaaNX6rcRlqhdNnVOVMwaXXY/+JPLZH4ZA5XQ1MKtbkKKlSk?=
 =?us-ascii?Q?BUQTu1mLQMGKH4g56EWGWFupQf5F2rjH2AsoUmftMnRx+9Wnts6mDzL1h+Vl?=
 =?us-ascii?Q?TInprLwbspOcn9UFmhDYUKu5MKcbdbUs3qZxtQ5HDP/pCWn37bUd0nJesXbr?=
 =?us-ascii?Q?DoGezegrSFC7QyL58OcI8hplX0vr7YzdRJAA3k+ptSWHPkgizOnWmEvsj2iK?=
 =?us-ascii?Q?zSX95jeSy02E08gZR49z4VGP1xMejo9/iSFCWU6EBj5dCFFQSrMZyqWK809f?=
 =?us-ascii?Q?v22YHD2O/SobequZcGNDb07cwXbqsexiD6p7yNyp83foCHo3mQgKnyKB/Gqk?=
 =?us-ascii?Q?R0bLdWzooiOFvlZg3gX4pjlrN5gIUQtql4KcpxEwmyB5YCEN88exG91bJ4Hs?=
 =?us-ascii?Q?gXfhgQ2T3GAUWSJ48jGOK4BUbHWtasoC3FMhUSvYjd/C/cWj/tv8yfKaUdGS?=
 =?us-ascii?Q?/B0FcvqU0Y6KWqhuaYzeTFDtRRN8GJc=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8543f17-9b97-4dec-b71c-08dec86efa9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 10:40:10.9563
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sfofD3+EZ5ALgYGjx59XRRK+fAiBUE2/eGkrZ3MqpjZZETx+B8WZ0msLtzGsdYT7YoEDPXz9WQ1palrCaMCnR7rWvOD751+yaOKjUZBkSRg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13411
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33916-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[bp.renesas.com,glider.be,gmail.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:biju.das.jz@bp.renesas.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:john.madieu@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,bp.renesas.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D7475678BD1

Hi Biju,

Thank you for your review.

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: mercredi 10 juin 2026 10:14
> To: John Madieu <john.madieu.xa@bp.renesas.com>; geert+renesas@glider.be;
> magnus.damm <magnus.damm@gmail.com>; robh@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org
> Subject: RE: [PATCH v5 2/4] arm64: dts: renesas: rzg3e-smarc-som: Add
> Versa3 clock generator
>=20
> Hi John,
>=20
> > -----Original Message-----
> > From: John Madieu <john.madieu.xa@bp.renesas.com>
> > Sent: 10 June 2026 08:47
> > Subject: [PATCH v5 2/4] arm64: dts: renesas: rzg3e-smarc-som: Add
> > Versa3 clock generator
> >
> > Add the Renesas 5P35023 (Versa3) programmable clock generator on the
> > I2C2 bus along with its 24MHz input clock (x2 oscillator) to feed the
> audio subsystem.
> >
> > The Versa3 provides the following clock outputs:
> > - Output 0: 24MHz (reference)
> > - Output 1: 12.288MHz (audio, 48kHz family)
> > - Output 2: 11.2896MHz (audio, 44.1kHz family)
> > - Output 3: 12.288MHz (audio)
> > - Output 4: 25MHz (DIFF1, Ethernet)
> >
> > These clocks are required for the audio codec and the Ethernet
> > controller found on the RZ/G3E SMARC EVK.
> >
> > Output 5 (DIFF2) is left out, as it is not connected on this board.
> >
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > ---
> >
> > Changes:
> >
> > v5:
> >  - Drop Versa3 output 5 (DIFF2), as it is not connected.
> >  - Document output 4 (DIFF1) in the commit message; it is needed for
> >    Ethernet.
> >
> > v4: No changes
> > v3: No changes
> > v2: No changes
> >
> >  .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 20 +++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> > b/arch/arm64/boot/dts/renesas/rzg3e-
> > smarc-som.dtsi
> > index 15c22dbf0ad3..e951609d39e9 100644
> > --- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> > @@ -78,6 +78,12 @@ reg_vdd0p8v_others: regulator-vdd0p8v-others {
> >  		regulator-always-on;
> >  	};
> >
> > +	x2: x2-clock {
> > +		compatible =3D "fixed-clock";
> > +		#clock-cells =3D <0>;
> > +		clock-frequency =3D <24000000>;
> > +	};
> > +
> >  	/* 32.768kHz crystal */
> >  	x3: x3-clock {
> >  		compatible =3D "fixed-clock";
> > @@ -137,6 +143,20 @@ raa215300: pmic@12 {
> >
> >  		interrupts-extended =3D <&pinctrl RZG3E_GPIO(S, 1)
> IRQ_TYPE_EDGE_FALLING>;
> >  	};
> > +
> > +	versa3: clock-generator@68 {
> > +		compatible =3D "renesas,5p35023";
> > +		reg =3D <0x68>;
> > +		#clock-cells =3D <1>;
> > +		clocks =3D <&x2>;
> > +
> > +		assigned-clocks =3D <&versa3 0>, <&versa3 1>,
> > +				  <&versa3 2>, <&versa3 3>,
> > +				  <&versa3 4>, <&versa3 5>;
>=20
> No need to assign clock rate for unconnected output. So drop <&versa3 5>;

Noted.

>=20
> > +		assigned-clock-rates =3D <24000000>, <12288000>,
> > +				       <11289600>, <12288000>,
> > +				       <25000000>, <25000000>;
>=20
>=20
> Drop <25000000>;

My bad. I missed that, these removal should have been handled in v5.
I'll address in v6.

Regards,
John


