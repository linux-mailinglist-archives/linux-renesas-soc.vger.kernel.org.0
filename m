Return-Path: <linux-renesas-soc+bounces-31608-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPoXMe0N62mvHwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31608-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 08:30:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D7445A412
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 08:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BB6173006801
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 06:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1457A3559F5;
	Fri, 24 Apr 2026 06:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="DU71aYqq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010003.outbound.protection.outlook.com [52.101.228.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439CF34EEED;
	Fri, 24 Apr 2026 06:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777012193; cv=fail; b=fUPxxKj8jghOXNfPKtr5IE5wJCgNjriUFPTcAXocfdXIpWrH7vF/pndHWIEAYV6S3491ZrakV/YkpMcBU2FxV4WfxhJqG4HFlT8NP8Z5V5wlXl5JKGNOUWe2keQdZ3xwATfBWszER6Yv1YKn6BxH3vw8soQk3fZ//RXwF/3TdWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777012193; c=relaxed/simple;
	bh=kZFaoR9qLTxcurhITXAVgxhSypxzulRsfh1yHYnCgc8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SKueI3xzDcM7k7xtK39904be5R5tNBbhes+D50/BhCfS3Qy5/zho89L7yv4CUMUqh5e1Vxt4jLZ/3ZRLrrR8Rv77WiHMkTJRV4rn3CtA1tYL4bOkh9JjltBZOSkmVm/qU5Ywctm7klNYodQQZwbuk6AFwe+9/bp/EKEmhCcptLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=DU71aYqq; arc=fail smtp.client-ip=52.101.228.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eotq3aLytA23MdSm7B8Yvj1LwWph7MX6lZj/0nepL5JUgaANMhkqLmosxbezseG5V1DfcJsBSf8DhL3T7JJT4VglgxNuMqdxRkXsjcubFKIbEC+ZnCUsnG5IXbRqBGNglAW0Pk7xdvrDSacKbHq6mUTNQ+n2zZtz7y8FlnPeBsiB+Q5rqFVT8x5Hmo0JZ9LO+a7LEOhAjn3h7bhGYmK/1Afa6rIMY8SBuGyO+cb4qT7p/qHedto3c9JJDUzg5H2jbg8LvD/dlSuNQMeCN7t58pvxN0ViLtYJMudi2Hpic35BRomy73OK/6tRXX4g5w8WSsvghcd0cwh/ewe/ttUjxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyeitILrAcO6pSrNNXFfqyMiooKIwBqp7la8PB9FUa8=;
 b=kGQETQohlxmPb6KQlUFeZv4uMQTtmaaNrTNUEGAwkXUUlsdbywfKZGAjZkwszLBXfXYJ9TIUuaYeX6Dud2bzZWMaJzJ8ytnBEdWyBuSMvBZDhyCFz0IV0tUtiIGoB/Zno1u6oKVN4yes/rTVeOU61xxMIWcQM5t9osRVd4Ww3bYxv78jF9BhJPrxbyxEAXNCHd6UCR4KhSWuFCDt7two/85Wu/Ofogbg6CSD5RSdnkOCTnKkVtDHWdpao1kCNXKgul9FmGV30xh3XTudv8iXAC6eHNfwjBquYZ/qImyxJBFnPT6uLGU8ktTIKprZR+SpG7zFMaYSDoMhjvVlpGU+zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyeitILrAcO6pSrNNXFfqyMiooKIwBqp7la8PB9FUa8=;
 b=DU71aYqqXJDgN+YM6k5u0lTt+iMgROXF/XtAteEgbkHgCNUaCqCyMO0HgCdMr5dGj4xGdX2xTo5NKBWFeu1BG4NKTjY5HXxNfM31zNGygmL/ki+o0ZsRiy+GPgF/bu2qoDwA3hZhkH0+q7fzGy8rcImnEQmjKjrIQlQ/ACdOseE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB8831.jpnprd01.prod.outlook.com (2603:1096:604:1c4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 06:29:48 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 06:29:42 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Mark Brown <broonie@kernel.org>, magnus.damm
	<magnus.damm@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH v2 1/2] dt-bindings: spi: renesas,rzv2h-rspi: Document
 RZ/G3L SoC
Thread-Topic: [PATCH v2 1/2] dt-bindings: spi: renesas,rzv2h-rspi: Document
 RZ/G3L SoC
Thread-Index: AQHcwqIUBy+4u066Q0GCKk6+MmJ73bXguIOAgA0ozjA=
Date: Fri, 24 Apr 2026 06:29:42 +0000
Message-ID:
 <TY3PR01MB1134691789E55E415E315658C862B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260402131020.143123-1-biju.das.jz@bp.renesas.com>
 <20260402131020.143123-2-biju.das.jz@bp.renesas.com>
 <177628854701.543173.16954025159083410550.robh@kernel.org>
In-Reply-To: <177628854701.543173.16954025159083410550.robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB8831:EE_
x-ms-office365-filtering-correlation-id: d554b812-40a6-41f3-72d8-08dea1cade91
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 Xw3h95rfYCDWJ9NsjFofE3EdcQ6YPHedT6A+nORbZ8gp7TgGoo4NTrlkbg0tgibni94tFi3+ZdIqDEbd+2gnI0IX0CRuvVNcWpAygg1Icpo6xtavBma/rYQE71V8B2LBfnC+73mlJe68jGIHZjqhs/pWftNGyS2x/dCQAFVX31MivUfZWcIZMx0sT8jIwZ+V7EA8CuGH5v/OYvoSsvmJFgdfDFODaUUH/gWFQ9VltdH9pcVq5ypGvajcvhjpoKlyoOLiALcT6vrUfZQyjHjgejxBNty2VZCyaSa6soWybFSI4WJ22IJvQ/arrxfVpUQ6Mka6pFQyssZrK/URU+AlWRZ0t2J4ZmKp++3LBfdBWLE1EaALSstFxKrkaU/0TyFRZpCvQqufbR2Y9Ei0TVg7PnHpnvxELygZMpHhws+NJzgoU8QuF0aoe7FzHDHXt2GSaLEX6T/qwax/ZlmNmycGA57ZuwryVCsuroQO7L6Mry4GpqLW9wzs0fKa6qTu6PKEW4z2GC077hNIlIOjBzyHccPJ3d1Cna3qb7EdYKifixQfi2YoTG5mTQgtiNsHgLXTVWM9hMF05K84kfQJ3v+uRxdC0aI6cpgS8yHfTMlVfDGGvzM9D+wbDVm73VRreWorJbR2sXkOq7RlACm56hEOFw15GWELaO6YAYrQ6URR0JNd3ICLzajyxKEPX5vUHWYCBNGP0W2NEQU7wygGq/3As7SKKWliXUAKkwGlJTxHL5Xtd0c28hn3Cs5f1JvDxHVbOYNwsuMGRbVE1EzLcyCT23JfPyXoRUnodOi/iOSDZ9k=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3gA1DO4ZgEy9XafthAgNlMIyvkVIOdNpfFD/B0RPqS5eyVAcVHUjRN03wpVW?=
 =?us-ascii?Q?xf6iTQN8HO/VtSiAX1feyijLjTDFOQcop2e0t17zLcCHr6x2WDYKNSGboNct?=
 =?us-ascii?Q?5GblxipHccsbTO+iN7aBmNXgysO/aWMBU0m3y5Us20qGAungcstEavJ1W5ye?=
 =?us-ascii?Q?m5gJUHv7KArdrBP3/tNRnrULcEnwskOIrNzVzDX4MHf4/iGMS0+SxrluWEjo?=
 =?us-ascii?Q?2ieoGTJSR4mVvK1OYOjxjRyEy5IGdlcjAO5Sp2jJSqSt5bA3eLQYPtSp7EA1?=
 =?us-ascii?Q?IMqUROA1UTX8BkY3nxvYXGwJjEBWLp+ruihUAqAnOKQPMPrTzq7l7AKDE7aS?=
 =?us-ascii?Q?pqJufUjfHFE4SsLnfvwf0fgVdDXLgc1dSZi8jWkGFrV7S4aQD/0702fD2D8V?=
 =?us-ascii?Q?zJq7gnPOi9VS0EMtYN9DagASLgNZk8O/T9pSJnvz5kHFbWaqKcJ0IqMr+C6u?=
 =?us-ascii?Q?SbLo/B+TNaqJb1Na0U0D6SaOFZl3XSdSbKT+25V6P6leXrrEe11In3Lk+QJN?=
 =?us-ascii?Q?NTDW4wGif+BITueLkTmWGByww2cjIr+w8pp49RBPCtTCuSEUgKFo72CaC5wk?=
 =?us-ascii?Q?8sI3syECcK113NR39xEatrpkvw4orshvpILenFuh14hU3yZxPEyhPHtcJiRu?=
 =?us-ascii?Q?fLmy4+kwXwRtApXewf11fXcwMdJ194Ljy1Vtl2RKPfLaDPB1tl6XM2GDiI6g?=
 =?us-ascii?Q?v+XsChKtwDbhs8fITat56fPtvbTgCM6HOTNfAKKWM65Eqt5HWla9zfxVHzVp?=
 =?us-ascii?Q?fprUZYxET+fdDRtKVEOO+9GT3YbVCHHhdw7RvqbZfiBIMfEIYsDfYizxuDy0?=
 =?us-ascii?Q?oD+fGSwyfqIj0TxmlnWMvykg1knyppwgaP6GlKD7ZBbKs3U373hGs7KvHb5H?=
 =?us-ascii?Q?sT77rplnrTa0xv3BZfENuMPJHLcyZZcNhfRN6jdZjytt3fuN6EVsEjKWF+dc?=
 =?us-ascii?Q?IgTg5p934tH7lA9pAIwgup9CM6KqV5NAw1VPtbuNiOFuEsB2uQYGWuzOs5Ie?=
 =?us-ascii?Q?BMJ48rwdl01QwpSSgTy2ZZUKgTVtTBsSkXTjTQj87p1K+1EPOOnVh/I/8bku?=
 =?us-ascii?Q?dWHi6ReZV7+b1bdMKoud9Vbf8IgfQQesz+PCtaeatKBNOC4u6CJbrIGecZWX?=
 =?us-ascii?Q?rDhvaYHvpdXFD8bayUo3wi3VbeAGfnfSzV1mB4aRSd7wYz1RTUj5qg+XCn10?=
 =?us-ascii?Q?oVjvDu4bUtfK5PkSJR8wT3WWg5qUmP4agd49JgaRgXKpqNQqZqlkpyLanEk/?=
 =?us-ascii?Q?c7iuEYNpSgNG0279fI4Dcn11tZTSWako8wrmCahgqsDq81s9LgL5x2XNB2Ei?=
 =?us-ascii?Q?w3gk/Wh3eF9GUq/2Bm1FHuLQ90Y77l9eInVUkYNNbuigrfdEl4u8hVdDyw0K?=
 =?us-ascii?Q?KT+GftQ6/e7ulPX8AwgYLrThiBplgSvLcc69Hyhq/Pl6BMNcQgOwH2gZi0Am?=
 =?us-ascii?Q?iV1rL3mV3Zu2UVrJ6iT30z52TWRaYs8Fbl7VJRVcDsizB4tUZOuhUXQuFbNp?=
 =?us-ascii?Q?tQfhfh70tbvVJiMps/SIF1u8pYUB5dtLpPL80NeSegu54gDNiRf21myTy2sm?=
 =?us-ascii?Q?+lpS6JdGoVNBHTIo1xmc6K6qZz2/UYYjNgM6fM6qHzhKbt9spZd3mJj/SltE?=
 =?us-ascii?Q?PsbyUL6micsmHz/QxyETynhWkB0fd+UNDGx8h4AdTfQhYyAZaop6HD2g8l4/?=
 =?us-ascii?Q?NgtFWRpaLjceuor6GFBflVZRFUUnw4K5M4SAqQ0uSl4dp5eiM4mau45fgU8p?=
 =?us-ascii?Q?JfNnlfXO0w=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d554b812-40a6-41f3-72d8-08dea1cade91
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2026 06:29:42.2229
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Rmdf42idxRpiFoO3yuCACAirNqF3n1/es7h9aDjtZbAENHG57ik0ih6m+IlpFT0zvP0QTNrM1wFaSis8okho15OPGglw8E/WKH/5+L+ELE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8831
X-Rspamd-Queue-Id: C0D7445A412
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31608-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,glider.be,kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email]

Hi Rob,

Thanks for the feedback.

> -----Original Message-----
> From: Rob Herring (Arm) <robh@kernel.org>
> Sent: 15 April 2026 22:29
> Subject: Re: [PATCH v2 1/2] dt-bindings: spi: renesas,rzv2h-rspi: Documen=
t RZ/G3L SoC
>=20
>=20
> On Thu, 02 Apr 2026 14:10:16 +0100, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Document RSPI IP found on the RZ/G3L SoC. The RSPI IP is compatible
> > with the RZ/V2H RSPI IP, but has 2 clocks compared to 3 on RZ/V2H.
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v1->v2:
> >  * Collected tag
> > ---
> >  .../bindings/spi/renesas,rzv2h-rspi.yaml      | 26 +++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
>=20
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>=20

FYI, this patch is superseded based on Krzysztof's comment to avoid
flexible dma names for single DMA and the patch hit on [1]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/?h=3Dnext-20260423&id=3D5277c291968d87c6a093f50ef489df9d52cb3ca9

Cheers,
Biu

