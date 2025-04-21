Return-Path: <linux-renesas-soc+bounces-16203-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B77EA9560A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Apr 2025 20:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 358EA171652
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Apr 2025 18:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0BC61E8847;
	Mon, 21 Apr 2025 18:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wIxLwtMA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011038.outbound.protection.outlook.com [52.101.125.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291FF1E2312;
	Mon, 21 Apr 2025 18:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745260831; cv=fail; b=EmEZuGZv5t1iZOUhLnN+8S+QvTxmQXOnlT+eWuytUx9Wg6PqClfSbsqHNI6IKlFMfnAhEq35ee27hhlIFXQGTViUGyIcXrxeoaeZezQWTEN1KJdXKKHOK/LtX3o2M2tsrMyKSMQ4ZgJ7O8hKklMvi6DyDsXY2E6VlXAUa664p9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745260831; c=relaxed/simple;
	bh=586fT23AAfEpprqfs5wseqaiCMlSIxOr3YDfUHc9q04=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NjnBMWc1CC8Ug/ZzeflXDrd7Ox6VfB8d5hfgWKJMH2SEgv0kx/eQhId54BbrpdUgK6UrSRH2+fyKyWQYlJN22si+qOhUPFNd/5reCwLcmV/Uz8WdVNE0loT+ulp1HAhSS14DfwGdbvuDF3lHmIFmaSOTe7ZRrkdWuAABl75JOC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wIxLwtMA; arc=fail smtp.client-ip=52.101.125.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bVlQKU5PIeqV7vNr2uEEeqUZDp9mxuIBp/gcNX/OfLG+LFcBvWGpz6WGgEN2yqmC8b7z2V+bLeFGKZ9+6VkZ+HNnOt8Gmf2oTWUzO3q9hqgdS9lqG00Ewk5tx/8C2LH4SRkkm3/kQGU6GoUndsIOq09uwKYsD3jrE00GnyQ1gIyCbC6NSD6uHOo+dB/GN8g449Xx6+Ffs2kiqg9gdR7N5bvO2aSyxDpL93fI8WfPNWGZ10NIhp86pAvtVh0vH26ctDUeN44JxpvOByaoaRfBR0Cp36CDEckfim4Ia/PEjfbyFJR9Qp8RZ35mV/ymocUceGXDBDiU4itWa9ewvzVFKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/y6xUUCeWXgl2A7WfE4UJwQXFJ0fjUbGiEGva9GUbKQ=;
 b=kqTEeXxQ4GABOTtbnN3YLd8ogOFfyA768doarENqEZxZR2iIw7euubVKdY0On4dI2uF+Y4zdOJYxcf+tglNw7Vi5NNBDUHkxZgNmq7YNFn6qjyt1NFiMlWC6en/Uz2SVM9XQ1yLls/sjy8JyPIlM3nJ4mDlJ18wKjyjDZFUynUPcAoeGExDt4/315Snz36hnSQD68C0WaeqLk/lzOSth2dIyLSuwJT6pbwpVw/sfj/AlVF1u0iF9Gr7O3rbJDddzfDYbp5sWphjRmQg8rChfBun75Hxdt0AWjroyiU2WVALO1/P/kaaoDmI5i33ssnXqnOiyXhZrEMTTH3V6URApBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/y6xUUCeWXgl2A7WfE4UJwQXFJ0fjUbGiEGva9GUbKQ=;
 b=wIxLwtMAa4sxr1//FzjUZoXlIOtRMV3fIrWrBGq9CU1gbKAbgfkOkAd/nHWMqVUJuaZ5dOf09E58cKs0CDlLTKyM7WpQEfBn+VkbiiFUJVYNRJVrFN0YI6PUjW+8KcGcF5MUY6YHYzkUCBrHyGYHY6gyGk739foCAInkVNwReGM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB13584.jpnprd01.prod.outlook.com (2603:1096:604:35d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Mon, 21 Apr
 2025 18:40:21 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 18:40:19 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Andrew Lunn <andrew@lunn.ch>
CC: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, "Russell King (Oracle)"
	<linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Richard Cochran
	<richardcochran@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu
	<joabreu@synopsys.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
Thread-Topic: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
Thread-Index:
 AQHbp7UXRdTsn2oCYUWD5qYhUQGHu7OjbUQAgAAVgQCAATLSgIAJgP8QgAAGBICAAAEN4IAAEkSAgAAhbNCAAAn7QIAACJ6w
Date: Mon, 21 Apr 2025 18:40:19 +0000
Message-ID:
 <TY3PR01MB1134690619EC6CADD07CD2DE186B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z_0-iH91A4Sexlzj@shell.armlinux.org.uk>
 <CA+V-a8sS0TtS-TEdkQ8MB5F4JtzV9358Y9fmKe5MggGU+wP=4Q@mail.gmail.com>
 <CA+V-a8tbW2Zs6op20yRTcihSm1bcMC2dYnRXVCKRf=q4fymZyg@mail.gmail.com>
 <TY3PR01MB1134633A8CB82788BB98C6E6286B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <f27b0531-11dd-4074-9c79-172953d28292@lunn.ch>
 <TY3PR01MB11346FA4767B74B2CBB2CAFB786B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <c27a2359-ee55-4d20-907d-314eee30ed4f@lunn.ch>
 <TY3PR01MB1134652607E0CB04ED520EDFF86B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB113466ADD365C6C569923F9A486B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB113466ADD365C6C569923F9A486B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB13584:EE_
x-ms-office365-filtering-correlation-id: dedee4d8-d278-4674-5bc3-08dd8103f7a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?MiNpPVBl+V44k9kVIvZDVutBj/qTdhDLOet10oB76MqoKMHpL/fVM0yMZRe+?=
 =?us-ascii?Q?7V2lWnYtBzbHa5sOpcFw0II91JmpTGf3U6sv2PaAKhGoz4/GHSScybc41Uz5?=
 =?us-ascii?Q?HO7rDUOAQkmoLSX1fVuAnh9eN/FltunTqQfsN+FIYJXrQMNXVsEjNmJ1vcvq?=
 =?us-ascii?Q?pyfGKyXDFIsuY6evlN3dVV0M2sMzPlXeQyXkIfg8RSQ30tTlwReuz1gGYrKj?=
 =?us-ascii?Q?IgaL1NHSYSMRjLSign1clV5Ht5OLt/p3s4AZ4OzieXO2Dfi3tq4QOLNwSSqR?=
 =?us-ascii?Q?SRNzxwfWqghtTcRcCONNBLMpN8LFdHaIDjya4huJgF5f9kzjFKw9lF+Hrzhy?=
 =?us-ascii?Q?u6sdAWcUlA8uaRvYlxiKsY/O9adWHobfoTS1SSqky/6u86MTIhSqGNfE6lOw?=
 =?us-ascii?Q?RpkoG4GQui/1BI5OjwoaJdnAVOH7qV5IrU4L9IRKEnx0KQcjd0js2nYyzSXm?=
 =?us-ascii?Q?rZl92mzx41qpnz6Z6Wt7L3pIlEb2nLHSXtMKnwP01aJQiWjnP8X/KwdZGym+?=
 =?us-ascii?Q?sRAl6tK9kNuhQTpEjMMF5AUAY2udcybmJrhlN0ZXThgx8NrajIfCh4ehnA63?=
 =?us-ascii?Q?bOCxfBO8gHC/IQhL3Bna+kvUh9pwKrvu7du4sTzo4RzXS8N4Ujh8dc56A7sV?=
 =?us-ascii?Q?kHe1vLz4Ho4V+NQ1YPIR1AxDTa38SylPq2MKoZ/siFnDPLlMQmdxA7aNSPkI?=
 =?us-ascii?Q?H78i1qoD0rZzMYiVVWrvt8MRfPx2tZRtsGOtxzZYyJUO6qromZlvSt0y+yFO?=
 =?us-ascii?Q?abTQMZGFsZC4H7K5nIWDY7N/DOe77xjSynYFxzm2fndeltyV/LUH9yPKF1ZK?=
 =?us-ascii?Q?t+wJUSWBsDQqIZalLTne5GbEwOvYI6nE6eJZMd6AQGU9gxTB1sbeuCRJDJnp?=
 =?us-ascii?Q?RzsRWtwxpI1f5YZqSfr3ItkXd/JUobIydzO+QbK7+TmQPAdHXK1ZKQ3FG4au?=
 =?us-ascii?Q?ss5q+5RMCEv8xc2AcPD9Kz7ETH84JOtKWNVrORwGXhGhFiM2tijaDv+SwFb1?=
 =?us-ascii?Q?lqdOxByCkbGaYZp+LWnqjU69WKb675CFwJkznfo5Ca1W6OsoruogHGnyKBos?=
 =?us-ascii?Q?71kUrcfFEwOZC4VLlkA10MXW/Xsd6J2/lqLGeU5GUaRd8sxm+m4gDNYt/KYi?=
 =?us-ascii?Q?zJ/kIhs8ad+/4AfBQ9GoK5WOtWuzls5tVbGIGyMGU4eXKk8q48jXml6XJmyl?=
 =?us-ascii?Q?ww/UT/xkzPfq1wVtXobhTF67QX9JbOpSmTCE8I/3F/5C/uXaypkjv5EZNHs/?=
 =?us-ascii?Q?/quavrdq6jwModLGJTmbZsP0+rPplBiar0scRCuDeVa1ArrlaMfYfeJIh1ft?=
 =?us-ascii?Q?mCun2aIQCW76ftE7oIKEdQ0IFoHrTsCYLKaOtiX09iECVD99vUTHYp1YCg3t?=
 =?us-ascii?Q?UHjEHS1tDV7k8Nmoxf4xVhvUbOKRaH+cqH5+9DIkjxUW9tYUaod9PXh4/exi?=
 =?us-ascii?Q?+jbKsZoHyPdBJF11G8iYK7/CKOEKrdhslOifjLv9wcE5MwaYJNuO6g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?wFFbYJ6RAHEl3XN6E5xWjIfM2A1xB/dZNXqUA2UCdrNVKmg1i/ouJMd0gX6m?=
 =?us-ascii?Q?ltHKMCK0AuxoNKBy4mCyRWL9Pd97L8tiosEPD/hgFCYfYqGO3Kp9WcqeQzqo?=
 =?us-ascii?Q?c86iC3ZAg9TaTCpi5DAu6HXIGpTlZvwZTKGNqKBgaKb/pU+oO36mHAOmXXnI?=
 =?us-ascii?Q?mx/FNPveXkxi/ku24VojkU0QVdDIz2k5fQ5HLRoLIHq9436WSNu0YxViqaJ8?=
 =?us-ascii?Q?n/OhBq9iwBWn7v4mujFxse12sE2xyPUjjbGKWxMqojjmRRFZaSSodGZzlYae?=
 =?us-ascii?Q?guEcYlTXt8Hfzct7syA9K1e8hKh6SwecSySZdKnvPAlfCCXVgNOEK/YLpTp4?=
 =?us-ascii?Q?6JMGW6cr+7iCK1cy1AxvieqK3/VfOhfllikFpLoL9jCxcVFJ7T1+HMenvqOc?=
 =?us-ascii?Q?z05ojx4cHPU4HYWkzbDj0zWmW5V1uSNWAh/325jBeHvXWay7t89lxsIouq0y?=
 =?us-ascii?Q?V5oMKs+EPxKh4ZsMtQASHF1syW2Upw9W9ssDzMzyGKL9Y0fCdhKh65s9iO8H?=
 =?us-ascii?Q?wQFLZY2SQd8jS4YfxfOvMuyzTkCy7efLvL6fEtfZ1F2abRirao3hNq4jPW71?=
 =?us-ascii?Q?pnsdgqDtdiiDMGAENO5OVp2G9N6+89PgHlzK6awt0l6rioDCvO2jbnD823kW?=
 =?us-ascii?Q?BBoca8xHl89SrfTOAVZNml3/AW003OPyD4y3RlfakoWa8bjw5xTTXuDvBCDc?=
 =?us-ascii?Q?MTtyfgKHqRdUtrorvZ5ajf0cFEWOP9vEbyQ2ywRqLy7sqRvKK1dTTitr7eRc?=
 =?us-ascii?Q?spZrG/lGbmfRhQUXyEYa0Y7JisqwdBIUxchjyGQahvcbdJjG+My0KAlcKDyx?=
 =?us-ascii?Q?RJLP2fChH4LpKOGw8GsVcXqKLI2X5WdBlZYHRCPmw9IfudKHyXGtN1+00QMQ?=
 =?us-ascii?Q?1vfV9TmwvaxU/t1GrXnH3njn487jADi0LIcokyas4mJykNoiTaE956+K8XVb?=
 =?us-ascii?Q?8F3MwzNSIyRfEPB6bSRhoMTWdDxVhHPAU5uXb+LFBDG0aZJjbi7WxbSdv1YB?=
 =?us-ascii?Q?JGUsG81xqPJYkDDH/shhlNcj5bAB9d3DmFu/nM0Y5IGR8CU3eCfL6owH6Sb/?=
 =?us-ascii?Q?i5dHeWHx25rvbSCMag4PHbgVdFoCjyDej8boRNLfue/HYGAowcUWRtxXrZLk?=
 =?us-ascii?Q?+nkuo9vadgBTBR2g++xkTnIC8s7ByHee3gmcl8H62X7Ba1O5TOK7U0RMid3e?=
 =?us-ascii?Q?nYGCKI3frVfvz6EQMJFNrXiXf8QL+RV7vBlzbfzxn/f5LzKf4gdG4seV/CpU?=
 =?us-ascii?Q?48WjV/WQXTpt3zpUIWljzpCUszVSs8IQMV9QsxBzgAqW+KeX+FEDhNI4gDtX?=
 =?us-ascii?Q?55v0F9Ku2h8WcfeBoG6EGWEjSW93c10T5QFmGNCdweCN/TQQxKaiuzByqDhJ?=
 =?us-ascii?Q?gHsNQ/8RHwaCRvLZPKK/mDjTKCkj5n6PhBJc/aoNx8M5T0oZlWI4N+V6Qhs9?=
 =?us-ascii?Q?qpFCYXdKUZv2tmEabqCNYcxjla0cYk54R8q/Pv+YgNCxUSGX0EAW+ThSQ3Bw?=
 =?us-ascii?Q?c6TzlqpcqhN+SMQmJLs6WfGsODhsKYkkVpyLNDE3PvVKGGClUaOS8boDO5y5?=
 =?us-ascii?Q?9ZJfKt1pDYgRyOq7ADTT/QrrPcB0Cg9hzxmOhYBNSBHdSqFeYC2cdKuVLnic?=
 =?us-ascii?Q?Ag=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dedee4d8-d278-4674-5bc3-08dd8103f7a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 18:40:19.5963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wx/UrwlXnim8trWCGschRr1FHMBL+kXVXuo2xpqDT9eBXFhzuAI3ouUTQRi8TruHihINQWn2xk0qirR8KeZ0rpaCPMX9SfZJUoHKY5jRGrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13584

Hi Andrew,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 21 April 2025 18:50
> Subject: RE: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer fo=
r Renesas GBETH
>=20
> Hi Andrew,
>=20
> > -----Original Message-----
> > From: Biju Das
> > Sent: 21 April 2025 18:26
> > Subject: RE: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer
> > for Renesas GBETH
> >
> > Hi Andrew,
> >
> > > -----Original Message-----
> > > From: Andrew Lunn <andrew@lunn.ch>
> > > Sent: 21 April 2025 16:12
> > > Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue
> > > layer for Renesas GBETH
> > >
> > > On Mon, Apr 21, 2025 at 02:22:01PM +0000, Biju Das wrote:
> > > > Hi Andrew,
> > > >
> > > > > -----Original Message-----
> > > > > From: Andrew Lunn <andrew@lunn.ch>
> > > > > Sent: 21 April 2025 15:02
> > > > > Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue
> > > > > layer for Renesas GBETH
> > > > >
> > > > > > > On the RZ/G3E, the upstream support for testing S2R is not
> > > > > > > yet in a usable state. So for now, I'll switch to using
> > > > > > > init/exit callbacks and drop the PM
> > > callback.
> > > > > >
> > > > > > FYI, On RZ/G3E, for STR to work with mainline, we need to reini=
tialize the PHY.
> > > > > > I have done below changes on top of [1] to make STR working.
> > > > >
> > > > > Can you explain why you need to reinitialise the PHY? The MAC
> > > > > driver should not need to do this, so something is wrong
> > > > > somewhere. If we understand the 'Why?' we can probably tell you a=
 better way to do this.
> > > >
> > > > Without this change bind/unbind works. But for the STR case,
> > > > without reinitializing the PHY, even though the IP link is UP, I
> > > > am not able to talk the NFS server or ping
> > > the host properly.
> > > >
> > > > I checked clock/reset before and after reset everything set as expe=
cted.
> > > >
> > > > Only change during STR is, on wakeup we need to restore direction
> > > > (MII/RGMII) of IO block for ET0/1_TXC_TXCLK (IO attribute) in the
> > > > pin control driver. After that looks like PHY init is required to t=
alk to server.
> > >
> > > When talking about suspend/resume, is this with or without WoL?
> >
> > Without WoL.
> >
> > >
> > > If WoL is enabled for the PHY, the PHY is left running while the
> > > system is suspended, and so all its clocks and reset lines also need
> > > to be left enabled etc. On resume, there should not be any need to to=
uch the PHY.
> >
> > OK.
> >
> > >
> > > If WoL is not enabled in the PHY, it should get powered off. On
> > > resume, phylib should be reinitializing the PHY.
> >
> > OK.
> >
> > >
> > > Which of these two cases need the reinitialisation?
> > >
> > > The reasons i can think of for the PHY needing a reinitialization are=
:
> > >
> > > 1) It lost power when it did not expect to loose power
> > > 2) Got reset when it did not expect to be reset
> > > 3) Clock not ticking when it should of been ticking.
> >
> > OK.
> >
> > >
> > > So you cannot just check clock/reset before and after, you need to
> > > look at the order of events. The loss of power, or a reset after
> > > phylib resumed the PHY would not be good. Similarly, if the needed
> > > clocks are not ticking while
> > phylib resumes it would also not be good.
> > >
> > > I would also suggest you check the datasheet for the PHY, and does
> > > it document anything about the clock input TXC_TXCLK is connected to?
> >
> > It is connected to TX_CTL on micrel phy.
> >
> > > Does it need to be ticking while configuring the PHY? Any action
> > > which needs to be taken after this starts ticking? Is the pinctrl
> > > resume being called before the PHY
> > resume?
> >
> > Pinctrl resume is called before PHY resume
> >
> > Previously STR did not work, because of not restoring direction
> > (MII/RGMII) of IO block for ET0/1_TXC_TXCLK (IO attribute) .Because of
> > this, the direction of IO block is set to IN (input) MII mode instead o=
f OUT(output) RGMII mode.
> >
> > Now everything works. Thanks for your detailed pointers.
>=20
> I need to debug this issue further as without reinitializing the PHY, the=
 STR wakeup is not stable
> (Linkup, but not able to contact the server).

Looks like the issue is timing related. By comparing the working and non-wo=
rking logs

On Working case, PHY resume happens after proper initialization of gbeth.

whereas on non-working case, 2 times PHY resume is called, one before prope=
r initialization
and other after that.=20

Working case logs: code change, see[1]
--------------------------------------

[   33.928696] CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
[   33.928696] CPU3 is up
[   33.928696] ########rzg2l_pinctrl_resume_noirq 3216
[   33.928696] ########renesas_gbeth_init 55
[   33.928696] dwmac4: Master AXI performs fixed burst length
[   33.928696] renesas-gbeth 15c30000.ethernet eth0: No Safety Features sup=
port found
[   33.928696] renesas-gbeth 15c30000.ethernet eth0: IEEE 1588-2008 Advance=
d Timestamp supported
[   33.928696] renesas-gbeth 15c30000.ethernet eth0: configuring for phy/rg=
mii-id link mode
[   33.928696] ########kszphy_resume 2181
[   33.928696] OOM killer enabled.

[   33.928696] Restarting tasks ... done.
root@smarc-rzg3e[   33.928696] random: crng reseeded on system resumption
:~# [   33.928696] PM: suspend exit

root@smarc-rzg3e:~# [   33.928696] renesas-gbeth 15c30000.ethernet eth0: Li=
nk is Up - 1Gbps/Full - flow control rx/tx

root@smarc-rzg3e:~# [   33.928696] mmc2: Skipping voltage switch

root@smarc-rzg3e:~# ping 192.168.10.1
PING 192.168.10.1 (192.168.10.1) 56(84) bytes of data.
64 bytes from 192.168.10.1: icmp_seq=3D1 ttl=3D64 time=3D0.381 ms
^C
--- 192.168.10.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev =3D 0.381/0.381/0.381/0.000 ms
root@smarc-rzg3e:~#

No working case logs:  code change, see[2]
-----------------------------------------

[   42.485978] CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
[   42.485978] CPU3 is up
[   42.485978] ########rzg2l_pinctrl_resume_noirq 3216
[   42.485978] ########renesas_gbeth_init 55
[   42.485978] ########kszphy_resume 2181
[   42.485978] dwmac4: Master AXI performs fixed burst length
[   42.485978] renesas-gbeth 15c30000.ethernet eth0: No Safety Features sup=
port found
[   42.485978] renesas-gbeth 15c30000.ethernet eth0: IEEE 1588-2008 Advance=
d Timestamp supported
[   42.485978] renesas-gbeth 15c30000.ethernet eth0: configuring for phy/rg=
mii-id link mode
[   42.485978] ########kszphy_resume 2181
[   42.485978] OOM killer enabled.
[   42.485978] Restarting tasks ... done.

[   42.485978] random: crng reseeded on system resumption
[   42.485978] PM: suspend exit
root@smarc-rzg3e:~# [   42.485978] renesas-gbeth 15c30000.ethernet eth0: Li=
nk is Up - 1Gbps/Full - flow control rx/tx

root@smarc-rzg3e:~# [   42.485978] mmc2: Skipping voltage switch
ping 192.168.10.1
[   42.485978] nfs: server 192.168.10.1 not responding, still trying


[1]
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
index df4ca897a60c..021f34116a4f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
@@ -25,6 +25,8 @@ struct renesas_gbeth {
        struct plat_stmmacenet_data *plat_dat;
        struct reset_control *rstc;
        struct device *dev;
+
+       bool suspend;
 };
=20
 static const char *const renesas_gbeth_clks[] =3D {
@@ -49,6 +51,14 @@ static int renesas_gbeth_init(struct platform_device *pd=
ev, void *priv)
                                      plat_dat->clks);
        if (ret)
                reset_control_assert(gbeth->rstc);
+              =20
+       pr_err("########%s %d",__func__,__LINE__);
+       if (gbeth->suspend) {
+               struct net_device *ndev =3D platform_get_drvdata(pdev);
+
+               gbeth->suspend =3D false;
+               phy_init_hw(ndev->phydev);
+       }
=20
        return ret;
 }
@@ -66,6 +76,8 @@ static void renesas_gbeth_exit(struct platform_device *pd=
ev, void *priv)
        ret =3D reset_control_assert(gbeth->rstc);
        if (ret)
                dev_err(gbeth->dev, "Reset assert failed\n");
+
+       gbeth->suspend =3D true;
 }
=20
 static int renesas_gbeth_probe(struct platform_device *pdev)
diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index 71fb4410c31b..741b5a7f7b93 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -2178,6 +2178,8 @@ static int kszphy_resume(struct phy_device *phydev)
                        phydev->drv->config_intr(phydev);
        }
=20
+       pr_err("########%s %d",__func__,__LINE__);
+      =20
        return 0;
 }
=20
diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/rene=
sas/pinctrl-rzg2l.c
index 4ea798cf78cf..e94f3fa7bb64 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -3213,6 +3213,7 @@ static int rzg2l_pinctrl_resume_noirq(struct device *=
dev)
        int i;
        int ret;
=20
+       pr_err("########%s %d",__func__,__LINE__);
        if (!atomic_read(&pctrl->wakeup_path)) {
                ret =3D clk_prepare_enable(pctrl->clk);
                if (ret)

[2]
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
index df4ca897a60c..c31c6c715818 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
@@ -25,6 +25,8 @@ struct renesas_gbeth {
        struct plat_stmmacenet_data *plat_dat;
        struct reset_control *rstc;
        struct device *dev;
+
+       bool suspend;
 };
=20
 static const char *const renesas_gbeth_clks[] =3D {
@@ -49,6 +51,14 @@ static int renesas_gbeth_init(struct platform_device *pd=
ev, void *priv)
                                      plat_dat->clks);
        if (ret)
                reset_control_assert(gbeth->rstc);
+              =20
+       pr_err("########%s %d",__func__,__LINE__);
+       //if (gbeth->suspend) {
+       //      struct net_device *ndev =3D platform_get_drvdata(pdev);
+
+       //      gbeth->suspend =3D false;
+       //      phy_init_hw(ndev->phydev);
+       //}
=20
        return ret;
 }
@@ -66,6 +76,8 @@ static void renesas_gbeth_exit(struct platform_device *pd=
ev, void *priv)
        ret =3D reset_control_assert(gbeth->rstc);
        if (ret)
                dev_err(gbeth->dev, "Reset assert failed\n");
+
+       gbeth->suspend =3D true;
 }
=20
 static int renesas_gbeth_probe(struct platform_device *pdev)
diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index 71fb4410c31b..741b5a7f7b93 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -2178,6 +2178,8 @@ static int kszphy_resume(struct phy_device *phydev)
                        phydev->drv->config_intr(phydev);
        }
=20
+       pr_err("########%s %d",__func__,__LINE__);
+      =20
        return 0;
 }
=20
diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/rene=
sas/pinctrl-rzg2l.c
index 4ea798cf78cf..e94f3fa7bb64 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -3213,6 +3213,7 @@ static int rzg2l_pinctrl_resume_noirq(struct device *=
dev)
        int i;
        int ret;
=20
+       pr_err("########%s %d",__func__,__LINE__);
        if (!atomic_read(&pctrl->wakeup_path)) {
                ret =3D clk_prepare_enable(pctrl->clk);
                if (ret)

