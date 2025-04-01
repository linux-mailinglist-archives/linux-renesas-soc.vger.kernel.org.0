Return-Path: <linux-renesas-soc+bounces-15240-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE9AA77ABA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 14:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D40AD188FC99
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 12:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72E5202F7B;
	Tue,  1 Apr 2025 12:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="nz9QvJXN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011037.outbound.protection.outlook.com [52.101.125.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CB7202C38;
	Tue,  1 Apr 2025 12:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743510049; cv=fail; b=emUeLua9gZgiaj6Ez5rHYcNKoexboiadLdaam4jXubxhsKAVUp6YzlWxuREUKi7LqZSj9zFEUbD5ES1qKNggJf/3sZdifcD/eGqclt6dW8OMktdr8CYWEcRMFCjI9VWhkk/sCQEUFoToqtjJ6KzCbEcueOFokAHMw7IBMNQS7Kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743510049; c=relaxed/simple;
	bh=d0uKxIPJ/0bOO9Ze39vZ8q+5mKtgLmdhoWsFiCaR9o0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WbhxjC9gbM/z2iuIBPah8Vl0wLupPGO6OFGe4BY9xNU39nZQEPRnfKNy8omRNIYEnadXJjPKZZOJScvbAdodDBOVS1cYSajETqeea+BUAM7qDtnYP8eIXziU7Sb7STLB+FE+dcG3IRxkd6KMgIltZGetHq+5DZawpML+zjDL5kQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=nz9QvJXN; arc=fail smtp.client-ip=52.101.125.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+D3uUHuStMyFTT115dBLviMFqWvdGdO/5rP3KekFGHume8Sz5Antb/3FzO/O/GIYdao2+AncsqM7e/DJ9GPRcB+0qRToSkdKkCiNuN2UcQX3fQWz81FdPtEeA5bDcJ7uZR7//IjqImTw3TL37u0La89g7krNlhwq4yBey4V7ls71duushSC6UJ16pRSsz5kUKJ+TiaCCa4Vx2TtaBPKPHvK7D2/UzY7p8xPinos3JJgZP/kxVPQRWlYWBQyTHkNblUEokRn0gx9i+96kNnG/O4ePtAkK6OG1GkwawPtKEuLm6v1KV/rLMPMTVPHxlhMPLTvljEClShFOoH6SYYbYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hB4P9nXGxtQUepO6uPhkS573PHnQG1i+JYELkOHXzG8=;
 b=vupSXMGVLp4d8IDdIptAh52yXshZpXFtWP603kfyzcYy3w+Gl9T0RJgkA8U3lBTu20YD97SRYbwTYlR/BRrxlvTGqNrAB9PPSa+5ZglmikPNXH9BhzjkyxGLID7OpZXDWAZx+/UdRiJvySChDD8mRUsNdRlJHPKmGGP8X/+6k3ZlIF2MlpcqmdcVZ2mjeh7YC84j0yRMITQEmovsxCmsy55KpeXqqAqk6hjnOtkmY47oz2Q+0HtPon3Ld4ihlvH4bD0Ox7sHiST/Ro27qCN2R7F0UpHAnrm4q9Z25oqrXoae8rmd38TRbqBPBbgroSnOM3YHkZU+S+R0sbWX50gWkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hB4P9nXGxtQUepO6uPhkS573PHnQG1i+JYELkOHXzG8=;
 b=nz9QvJXNAABB+XI0kiy8McajaIakswkeOJmd+G4JArdnstEkVJ0nWSFzYIaHzBvjlqq7wALGnKh74MO5XvqQXScScpUFGrUujhTN6K/9LQXbXVuoluUCHCjd/fNsJqBcaLg58ugXPO31wG0HE4oO5biwewoUKviMUxJNUXFfIJQ=
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com (2603:1096:400:37e::7)
 by TYWPR01MB10836.jpnprd01.prod.outlook.com (2603:1096:400:2a8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Tue, 1 Apr
 2025 12:20:38 +0000
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce]) by TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce%3]) with mapi id 15.20.8583.038; Tue, 1 Apr 2025
 12:20:38 +0000
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: Rob Herring <robh@kernel.org>
CC: "thierry.bultel@linatsea.fr" <thierry.bultel@linatsea.fr>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"geert@linux-m68k.org" <geert@linux-m68k.org>, Paul Barker
	<paul.barker.ct@bp.renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 02/13] dt-bindings: clock: Add cpg for the Renesas
 RZ/T2H SoC
Thread-Topic: [PATCH v6 02/13] dt-bindings: clock: Add cpg for the Renesas
 RZ/T2H SoC
Thread-Index: AQHbojhJmsq0S6Z4xke6zd5ya6ZmL7ON7XWAgADMS9A=
Date: Tue, 1 Apr 2025 12:20:38 +0000
Message-ID:
 <TYCPR01MB11492A8B94D939907DC79F1BD8AAC2@TYCPR01MB11492.jpnprd01.prod.outlook.com>
References: <20250331122657.3390355-1-thierry.bultel.yh@bp.renesas.com>
 <20250331122657.3390355-3-thierry.bultel.yh@bp.renesas.com>
 <20250331235933.GA2857038-robh@kernel.org>
In-Reply-To: <20250331235933.GA2857038-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11492:EE_|TYWPR01MB10836:EE_
x-ms-office365-filtering-correlation-id: 5be7bf53-aabe-454b-38a0-08dd71179cc9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?qGN1f1z4viVQwqquv0V4dxwyO1FJ6UV0E0EhaHgKqrgwH9QGzxnMNqNFNbDg?=
 =?us-ascii?Q?aS8eOs1ghulzl7i9P1yJ8I2GzUomOiJkLbtFmQgaAVLt9RGxfIgFeC+TGfnf?=
 =?us-ascii?Q?aehVzkAkuZIRAoNnJyuxg7tAtP6Mj2/eP3q4K7IwnOmjxFJvLfELFfv34Gsl?=
 =?us-ascii?Q?+iU6NQ5avBRAyhXtk+ZtMm/yaRr5pI1Ff8JXgFQPKUxnvFvvixBIUJpL0P6P?=
 =?us-ascii?Q?x1RMLIQvdgA/R53/KY7lHz7Sl3UPxZbKEdl7cGxAGVLSd7Xlb4ZOuBXz+z9D?=
 =?us-ascii?Q?miYgFd8drhy4J3lW+1fBPKrzlgFCJPvlT7I79DN+GzT57Nqq2+Oyz8rKZJBj?=
 =?us-ascii?Q?GBPmXY873dB8TbCDkjas4eFyKM9PhU6rTolmiycipF4fLQNK6mddLeUaPE67?=
 =?us-ascii?Q?aaSgOg2BuebS3YkDzT+OUNGDuLS0NMyAtDzAUY0DHMscvLee1JN+GCDR85lw?=
 =?us-ascii?Q?hLblbr+lGeCPWq7TypcJv1ZIP18/WhwrZZMMai1fnvSd1rwufIEg4OBHxH57?=
 =?us-ascii?Q?2FrqIdnr9kfk+ArXGuGzrLgvC6/T9GclzuvCYXgEgIZk8QM65PS3zHDvALCg?=
 =?us-ascii?Q?GpqQzq73xzmDZDTsnLDPHf/vU/gbL+MR5RRynb78LLOO/y0zkez8WjMbvYLn?=
 =?us-ascii?Q?gmTE7H5j7mwaXmzOHYdGIjcl3ZW8itO4R6XHaGVW6FWe3KvKuOiTutb5XMjQ?=
 =?us-ascii?Q?QAICO33CwR7ccimTfdXQzE0v8Tq0GSQhueGANJZjQXHSXlnWL1gw6NZz/ZV8?=
 =?us-ascii?Q?IVKy9K3K+glsuSCZh54RWsSSmQx56yOnW2EBLMCYSdK4WmEvmf8gYGWRPc4A?=
 =?us-ascii?Q?oHgK0vt6aowDMyNgwLK4KAWeo9k47d7NlWntxRKyAW0+o8YDleMM7HFNC7E+?=
 =?us-ascii?Q?Mivxo7Lwbw+a7856O+4NaXlfdyQaRL/6Yc176Z7CY2nohkGOetz7KOLytShg?=
 =?us-ascii?Q?20wwrqMRRw7EFl62dk/BHbaBvDAwG1qysVtBBRrm9fRi6Q+k1ZK3EcsaDOi8?=
 =?us-ascii?Q?wW9dFaxYgR+s00lxqL/vZUkZ8mlbmtt3v0iYcmc7HQ7udZBOzbktTb3cQEmL?=
 =?us-ascii?Q?4J0BeUR69gsXVpKwfOHslKpkP3a9Tsv47KxBqqJ/ANZryiy831SQI8M6z8/F?=
 =?us-ascii?Q?ogCP1/18E6s6D+D4dYtco9IsioBgMSz26fqXssUYzQ2LJBGE3gRelGeHGd/M?=
 =?us-ascii?Q?PdwFZq4znKSWpJV1Pr9V9h9iAzGaTUKrSrlfzGqqyUiaWSbK9uhLlo0k8UU+?=
 =?us-ascii?Q?bn6is/No7hqT1sus9O+82yZTUN+MfPzCGCGXOw64E7e7qgqB1WWdQDNJsYi8?=
 =?us-ascii?Q?e7irhs77z+zcRMkAHXPa3flhvL8hgApxCM/iDVMMHkCkYWe6xJkOZ4EMiJK6?=
 =?us-ascii?Q?mkEQZ8GLCy8125NKw+/onDp6KPEwtJRBQUYZ/hyrqtXG8Of03gg82tokWoHC?=
 =?us-ascii?Q?S4wBfqVGhSQwegRQ/nQVHNJVNaUyMfRl?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11492.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IfL7if1aVOQr33pIu13/+O9wsBf6MfwmmrSShBjBK5lD+qHvngNhs4Py1O+P?=
 =?us-ascii?Q?+5/sUqJciFIlTRkz1odINy5RpFo/3xAC7dvD+/Lr27kzClVcZiOzdOI01f8s?=
 =?us-ascii?Q?0d5jBnvINhIIdHAI8/olpUfNuUW+rovTYUr6hExMsVYBxgvGbuVDO14c/0I5?=
 =?us-ascii?Q?wylGsiV5iC20S4RANhYqW5lYkXkS4Z8ww53pZAAjusrBsR6/68Mi5E71XcWM?=
 =?us-ascii?Q?lUWIt6gDfE0QhG6WZxnIBjiw5evBU/ZjrrAnOV6mKbJ0ZKn4aY3A45r8VT9c?=
 =?us-ascii?Q?Y9YiZIx3vEOk8fZMkNJk3cuQKk7SqNDiaMOvNhJDWS06aJSasqoYWYo0uS/m?=
 =?us-ascii?Q?bqbQKOG4okGdU4FgrgsYpCGw3Z4r5CBbRwCmboRhDzVPgq2eLfu1dqrzzIyf?=
 =?us-ascii?Q?+Sn+0FAvksuyeZcJsWvtz93oLAR57SNvl3dt8uR5XkvhhFx29pHZ+rWkaYi5?=
 =?us-ascii?Q?rjSMQZNnqkSIibXwA8nYoTMXxGIEeQKSP3Cn+Gah3y2nfqHoDg7g4PyA3gE+?=
 =?us-ascii?Q?+PNXrcpTjaO3Y9YwLwWTmduQdgIbIyZZWBOoM6EmmTNgzAWfKKYXHl0a8EWh?=
 =?us-ascii?Q?J1k4U8Wi7H9XzW/iIhNTWJsTszAQt6J+Ocw6k8nmHwNhkjLzfO0DdhHOXUIz?=
 =?us-ascii?Q?GmhmAfPGxM4EKDIM1yK1H+zRiP0Mwf7cfpwXfihwEHOEW6OYR9FetLZQM0/2?=
 =?us-ascii?Q?FZ9w96KB1E/aYLFJSbAJQwNL+N9imifOk44jc1jvArIuRtONAl652ONaDkLk?=
 =?us-ascii?Q?lIrNM/yz2sh55BPCJy8oF6BSHTojmmC931oxqmKaqD52FAPudAP7KkdivyzB?=
 =?us-ascii?Q?sfX51DbdT+U+Tpq7Y1BaMoqB0RsKRqPeJhCWEywCEBgm5zrQqY4dPZ8/aUOO?=
 =?us-ascii?Q?0OoBOUDSVDBIimyx77gLgfLgq37iq5QqFURZKUKc8shLBXbvAP4fcsUz0p6E?=
 =?us-ascii?Q?H8/OsWSgxa35GNhDi4zP7r84NsJAVVuqEmWDA9ZBNJ8w73L/IqvMKB2PXMNA?=
 =?us-ascii?Q?anMAz9WzfRDlCl/qRjnKNpeSJium39rOt8zJvkqyOiXR4Am6W5R7TghdF04C?=
 =?us-ascii?Q?mz/xDKanrJpgG13kM/O1HmbJOgGrdSOFw1I8SUI/hRxKCsTjIzJTzuepH66J?=
 =?us-ascii?Q?UGc/G/DFhyiwHZRmQCm4iuH6xM8USkr2sl6yFjegrG8UNL5mPP0bEsbQ0Gbm?=
 =?us-ascii?Q?4lPy0MNilrYug/XdhXvLuQsXtftT6kFKJliDKMHBp45K6a7Lae5QjBTwzZ1T?=
 =?us-ascii?Q?BmrScOmaaCaU0U0FwxssR6VCZh8Y/VNwrVkO1OUDY3zv58pALHj4y/Uf4d7/?=
 =?us-ascii?Q?AJ4iJqtFtXSFVs81y7uFJW1HFjUgg40S3OTnqik7la9Gc8NRFut/rbvsjBYw?=
 =?us-ascii?Q?TT4rICySqa+TpqMPdA+gNO25I6ydu4A3N4Kc7NF8wBdNJoZHO8g/VbEhE9dP?=
 =?us-ascii?Q?ure0E0uXviQrcnXqvQmUCT/36lNlLBhYPcBjxJqe2en12QmTaKdmTvm1cRvy?=
 =?us-ascii?Q?NiTbl5DoNe2kC4voNy4yWsf6GfKjtOuMjBlFnjPCMeAtHHBQXdcpW2Gp3R1C?=
 =?us-ascii?Q?FCwcYdZHjvA6nWUy/lNbWJunIh6xO78XyGl0dDstRfqQK2B2xtley4947z88?=
 =?us-ascii?Q?uw=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11492.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be7bf53-aabe-454b-38a0-08dd71179cc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 12:20:38.4940
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QCeD2ErteUIvnNM4MHeU6vLyYZe6Uy8B870JNLJpua7Gpt2SanrUp3cM6JJ1OqrlFJjzp97+RzvcGjS5hKIByrLcsp4vsykDO5reYIRwmrpY0X+zmgQ4S982jiHRhj3X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10836

Hi Rob,=20
thanks for your review,

> >
> > diff --git
> > a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> > b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> > index 77ce3615c65a..dee4c44ef025 100644
> > --- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> > +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> > @@ -52,9 +52,11 @@ properties:
> >        - renesas,r8a779f0-cpg-mssr # R-Car S4-8
> >        - renesas,r8a779g0-cpg-mssr # R-Car V4H
> >        - renesas,r8a779h0-cpg-mssr # R-Car V4M
> > +      - renesas,r9a09g077-cpg-mssr # RZ/T2H
> >
> >    reg:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 2
>=20
> You need to define what each entry is. And do that here assuming the firs=
t
> entry is the same in either case.

Would this be the right way ? (maxItems become implicit)


  reg:
    minItems: 1
    items:
      - description: base address of register block 0
      - description: base address of register block 1
    description: base addresses of clock controller. Some controllers
      (like r9a09g077) use two blocks instead of a single one).


Thanks !
Thierry

