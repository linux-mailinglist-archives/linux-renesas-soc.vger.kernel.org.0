Return-Path: <linux-renesas-soc+bounces-28958-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CL+CXnmqmkTYAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28958-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 15:36:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F3A222C80
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 15:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DCA7313444E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 14:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1141A34EF15;
	Fri,  6 Mar 2026 14:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="rBN7Ty9z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011036.outbound.protection.outlook.com [40.107.74.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E3B29AAFD;
	Fri,  6 Mar 2026 14:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772807593; cv=fail; b=jGgZI/wYll8ffjl0Se/jw5Mlz5mH/60qbDbX6hwp+hsoPUgVuXE5djuxcMRYeVueW9NvV7wolYTRBEIU+K49IWpe99ym6zWL5xAyaI9oo/p28TcrO5AbxwfrS0ifPgrj00FWrXWifq+l0p+lzGRqiirNiaT4dmVl9eJDyKCoto8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772807593; c=relaxed/simple;
	bh=Ji/BXXyz8aoYZvI7D5QzLU1pFSfVYr0nDKayEcCiRMw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HnBQopuivclMu9ZQgLJc5VGrJ5oNgAYcm8RB/koDODnSS0mB57ojMopdjrQH81XEcRfWc4Ap4wYESfu9EDq0OCgV6EQzSxSd2xsPeRudAy/hbNF0yQwSAFAZ4XkM6EFjgSnn71fKQASyt2+669BXLjbfWmm0o3XIjgRJySPvYsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=rBN7Ty9z; arc=fail smtp.client-ip=40.107.74.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nRqSrzKpdW78Y02gvPJ4oXVOYE6vPJ8JCkWaRsSX8njoKFFyRhw3arggpq4oqmfty6hFVUqeP+Ste54ROk9BEiuHk5nXn+a2QeSMCxKtI7ZCax4+LUoCwa94YB6XuSwRV/Kmu1aqe6qabtoAVyCnY/dEgxbITwRoPtf4vssaMkbs4ZNAVzIEuzPmf7cX/8uHdCZxAd1Ivo9bbS8O7pJXGvRR/OnmJNEyXEPuyC+0Ltd+jVaF1qvNTTRp8k5dtsWNn4kPlc0m1cZhma+sgGOwdPHY+budwoOadF+W2KGyCienEtpn/ztIP41AZX/UuJs5fvPR6w0y+7WQoOlpBysoWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mT/sqp8rSYg62HspMcGMOcIDxQnuGc0LKkFULOVR/FA=;
 b=KFZzxVd5U95qwhxte6XcoAyOXgM0EnAbcgi8z6NSSp373SyBDD6Rf1T/nzPkjWyb+Ep1O8XU9E7TvARDlM7XcsHqht9LJO32La+HyV3ILcKxy03mWTXUuQqtccfkAlVh4SKs792wDzL57jY8Sm4/46JnruPbr5FkoPOjl5eE8uekXq2yGcOWu426fCI+b+f9SckCld25WYNMoJab0wJJ7DzjC0M6Nd4gKj3JGW8KNJwbHBbbN/Ao4ljkFTWbG4ev58OGirhi+iBG8yQwH/5chNG3yrbhWcXAa3y8Ry2O3WMeRc7iXGTD9XdgstpObeWk/bl1tzwjpIApci2JODiaQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mT/sqp8rSYg62HspMcGMOcIDxQnuGc0LKkFULOVR/FA=;
 b=rBN7Ty9zMGR7ORAOP6H/Mc/nsOsdOEXVxJvMo76kunvLL+UNWymtO3hIPKmaRJaCcHtWmLk2ENlXvy8Eh3Jvgf52ZE3wmfPYGms9zaMHRSoqDUznKtekkPtdd2CUpnu0zLhOUIOrGc4p8v2h7MgN2GzpthiIPEYRvpfDGrZhkAA=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS9PR01MB14170.jpnprd01.prod.outlook.com (2603:1096:604:365::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 14:33:07 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 14:33:07 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH v7 12/15] PCI: rzg3s-host: Add support for RZ/G3E PCIe
 controller
Thread-Topic: [PATCH v7 12/15] PCI: rzg3s-host: Add support for RZ/G3E PCIe
 controller
Thread-Index: AQHcp/6MRVhKQ7pRGE+/nFmphIYso7WWryeAgAAAS8CACuMWkA==
Date: Fri, 6 Mar 2026 14:33:07 +0000
Message-ID:
 <TY6PR01MB17377E0DB8F3BCB6E189E18DFFF7AA@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260227153236.55988-1-john.madieu.xa@bp.renesas.com>
 <20260227153236.55988-13-john.madieu.xa@bp.renesas.com>
 <TY3PR01MB11346B9FB9B0FE7BA3B82D6378673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY6PR01MB173776608DDA83CD05D26FEA5FF73A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY6PR01MB173776608DDA83CD05D26FEA5FF73A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|OS9PR01MB14170:EE_
x-ms-office365-filtering-correlation-id: 93ddcb50-129b-4f55-7f1d-08de7b8d48cf
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021|7053199007;
x-microsoft-antispam-message-info:
 bw453yVnrEQqMEr6YD5gXEupOoa/+qPD2BN7dC8KbtBfCWNOACMe4d5n+IjnsE/o9vkswEORZbF54h3SC1nl1M6+gHliXaPjIgdJJ0Rfs6A/v9USB2iaYTVaBaexmG8Aa+W1ltz3QREKBoE2pmE0cnpMQ1FY/GHfE3HOnMl6ZIwbVCIZA/E6NnirF6OUeNuhKVfeMcRh4jw7AP1+GYrJTCQvgErH6s94xIKEHr9E5BwBSKQrMPz+LNd1gaQd4Hm2T4rYSW1Glw/VMLRit8uPW8001v/7KUMEBFzdQ50x1uso5Tuw+Rab678cgC1xqnfA7lJI0x6rXoyA5f2RG1BBVmNO05bBjPSbpohpEEpyRZiHZflTWog4psBy8T5vrYz069Fqdye17sUk1q9JrKeUPRkNH3mFomN4zj61J7gIf1qS0INQmPZiZ4QDUs6HnounFn7CGFTJr284NoIUBsqrU2AIKN4CstXFHiiIxlpRTi/iIP4hJzt3bSVO3vRyrRGzWgvv8AOgtb3HLHkrrp1r5MXqbCC993EkVxWfMOKFmykwlog9Ppkdhcks3xdQS3rODnxZio83wEnrBKPDHVnECdRBv8IO4TRf5k9TqJAE0DyvVuTMvTrFS3WHXvjZBkP/qIb9yENgw1FljsGF6ZnZwmbCMtdVDTG3X96boBoATFScdX/EEPuBG0u8gNJ/XGJzNDJAmySaGG8720JWW7L5ADBfcEHXUTPxS/c7NlNqu08oIDiH08IXAHLuBar9ccHkOL4Ne7RAb2RbzkdP4LzUMJERbZvuhpJGon29PBIbziw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?DIxjU75neVMCBnaVhaSqt94MtnmUoqn4kyn+fWOvdegpzk4/7jLBNQNE4y78?=
 =?us-ascii?Q?40bohEJ23jDCKujLPEeHStq31XkAZ52s2NhjdBqHIYwf2LFQPQV9mu+RVyzK?=
 =?us-ascii?Q?lYS7Q12pZmFJciey/KeLJLGkLl4kXhTtVt5O3cdCFOlQy5OEOwKsVP900jLQ?=
 =?us-ascii?Q?/9Ve+W7DNzOvRNW1w0q9yonm+zjKu5PUY7Q43cbJBgqW8IoA9xTi7R4z4SYX?=
 =?us-ascii?Q?shUvbppLwcNV7qmpdpVogLckfJdoz4Z1GQ8JNHncNrL2sRZC4yJGjXcJ1emt?=
 =?us-ascii?Q?NRR4nGVWP0wiL9SyXW2PtniS5tkPQh7MNqNp7Anl3HireQgv1BxKG5AAh32n?=
 =?us-ascii?Q?AcVpp6YK/3iUutWwNQ7LhBHMLIbHGstSwx75j+POcSWy6hv7pmGcIBkAd59Z?=
 =?us-ascii?Q?u3en3Y9A5KsIWiOrLujqP/VOvGX3g3fVwdt7lPLmK2TzPeMFlmWc4jKHOwYr?=
 =?us-ascii?Q?94U5vLP03r3IApfWMcgriPKAWMDSqUaLhzYJ7YSA2m3W2yA5MhDyCXCP6ipp?=
 =?us-ascii?Q?ReHB4zgB5F3JWm5lnPBBv5NgBqKFJblokU1iGBO1Cdl7NriVR3/tmVsaekCY?=
 =?us-ascii?Q?mzjGCdhouxavHkIxvaOopj6Rlhh/5A8lZvd37bkC4d7XI89dzuWQ6Mt8auyt?=
 =?us-ascii?Q?RsHn9e/k5ase5ISWix6Ef3uWKqVzSBI2ve9u1v4HIqiWmogvodvtqhSNLoKO?=
 =?us-ascii?Q?ppW7sPGHa1mwonGcM85J84l0F0BV5jaJfZ3FPhnFB67OMgiQ92kqohpwqvaF?=
 =?us-ascii?Q?EXCwzrQSjKkq7rCl+jDla3W1phcOgSjv+cCMwOp5cdQASesG1Hjt6djrrYvM?=
 =?us-ascii?Q?v5gyZ0rXvzn97lJL47ijhSfBAUiWJJk1pCMJFamxrXeXVs4OopLZLG41HZBr?=
 =?us-ascii?Q?O/+H4fXFlXFQom/4CxlxRRrQHc/rd0e3XapzOhjumDpzX+oC5I19mRVrmdzI?=
 =?us-ascii?Q?lbiKZpDhvc31LdhAwFsQNiDLM35gacJkwMB/cG143iEmKqqn96qOhL0zuuI/?=
 =?us-ascii?Q?B0PhyPgWpIEp3FjQeUyWQDb2ZGfVrp70EPrKMFOCBo8/812IGd8t92aH3UfA?=
 =?us-ascii?Q?qHgULccGZFuiJ4uvuIW8fVExmQFbpTOta3oeP+nlLnymM6pUU3GoCIsHLTYe?=
 =?us-ascii?Q?SC9gFialJLnTJk4xsSRZS0wysQfp9aVg+ge1fx3sTRkfeEPayeYkzmtvYTn6?=
 =?us-ascii?Q?iS3CwnMdwWAIRZFbpImDwbib6diQh253rQVZu05vclLKg2SPNY00uL4ILA8m?=
 =?us-ascii?Q?kK413ZtubfQ5U/YdrKGgRuQuuqtXnkSSCwG6qS0B9/o+Ggj3aAhERgalywj9?=
 =?us-ascii?Q?mMKmAAbuIIVcj1b16o8YV19hiYQULzqgoEwzE6DPX9/zu6KUvoRYupFFS4v5?=
 =?us-ascii?Q?2e6ngXQB0A6eeY8DtTRFiCoVDOhfTkU5rTBgm+XfDIgjI1O7nKKz4AFV3q/t?=
 =?us-ascii?Q?5odxBT4LJ72RIhSkQ2p+7J7IyUs/o3kmRuoZGsJaCvojfY6cnqQ97Lki9BEY?=
 =?us-ascii?Q?inOwDZYYIFBViw/qqrU4d2/cDIG5kVXKLSWMz2GS6abq0IwwdfuwncgYq/AG?=
 =?us-ascii?Q?O1g2NtYxl4kgNEqW+VTlGgoywcSsfkeQxndkuKdX8nwz3NfCF6cXu9E/QPYP?=
 =?us-ascii?Q?6sjI7ZfikMX4fBwQKQeVeniHURZwbap/XTTC3q8cRr/q4yTtwzK4qrjG1D21?=
 =?us-ascii?Q?CHgqd4TtEERyLpMJnDug4VETQcm7Pl5SQUdwhC/pMbIy8tvLxf7rdyj8HSdh?=
 =?us-ascii?Q?f/wWyLbCZyIJ6HjKnLwnKEYfVO+kz0Q=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 93ddcb50-129b-4f55-7f1d-08de7b8d48cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2026 14:33:07.5222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SFPw1NjPTDWpSVe2T0LGdjTBvtybozZ3G1wmNOQRGVs2tSq9qpqCHjiK8xcqbCukXfS09sVxVYyemSYMUNGvWTLgj05RsNnD1lX/huJUCsA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14170
X-Rspamd-Queue-Id: 87F3A222C80
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28958-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Biju,

> -----Original Message-----
> From: John Madieu
> Sent: Friday, February 27, 2026 4:44 PM
> To: Biju Das <biju.das.jz@bp.renesas.com>; Claudiu Beznea
> <claudiu.beznea.uj@bp.renesas.com>; lpieralisi@kernel.org;
> kwilczynski@kernel.org; mani@kernel.org; geert+renesas@glider.be;
> krzk+dt@kernel.org
> Subject: RE: [PATCH v7 12/15] PCI: rzg3s-host: Add support for RZ/G3E PCI=
e
> controller
>=20
> Hi Biju,
>=20
> Thanks for the feedback.
>=20
> > -----Original Message-----
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Sent: Friday, February 27, 2026 4:42 PM
> > To: John Madieu <john.madieu.xa@bp.renesas.com>; Claudiu Beznea
> > <claudiu.beznea.uj@bp.renesas.com>; lpieralisi@kernel.org;
> > kwilczynski@kernel.org; mani@kernel.org; geert+renesas@glider.be;
> > krzk+dt@kernel.org
> > Subject: RE: [PATCH v7 12/15] PCI: rzg3s-host: Add support for RZ/G3E
> > PCIe controller
> >
> > Hi John,
> >
> > > -----Original Message-----
> > > From: John Madieu <john.madieu.xa@bp.renesas.com>
> > > Sent: 27 February 2026 15:33
> > > Subject: [PATCH v7 12/15] PCI: rzg3s-host: Add support for RZ/G3E
> > > PCIe controller
> > >
> > > Add support for the PCIe controller found in RZ/G3E SoCs to the
> > > existing RZ/G3S PCIe host driver. The RZ/G3E PCIe controller is
> > similar to the RZ/G3S's, with the following key differences:
> > >
> > >  - Supports PCIe Gen3 (8.0 GT/s) link speeds alongside Gen2 (5.0
> > > GT/s)
> > >  - Uses a different reset control mechanism via AXI registers instead
> > >    of the Linux reset framework
> > >  - Requires specific SYSC configuration for link state control and
> > >    Root Complex mode selection
> > >
> > > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > > ---
> > >
> > > Changes:
> > >
> > > v7:
> > >  - Renamed RZG3E_PCI_RESET* defines to RZG3S_PCI_RESET* as these
> > >    registers are shared with upcoming SoCs (RZ/V2H, RZ/T2N, RZ/N2H),
> > >    dropped associated "RZ/G3E specific registers" comment
> > >  - Dropped "RZ/G3E SoC-specific config implementations" comment
> > >  - Unified function naming to rzg3e_pcie_config_{pre_init,post_init,
> > >    deinit}() and rzg3s_pcie_config_{post_init,deinit}()
> > >  - Simplified comments as per Claudiu's suggestions
> > >  - Used local mask variables for compactness within 80-char limit
> > >  - Fixed L1_ALLOW error path: goto config_deinit_and_refclk since
> > >    port refclk is already enabled
> > >  - Fixed resume: reordered MODE before RST_RSM_B to match probe
> > >    sequence, fixing error path handling
> > >
> > > v6:
> > >   - Use rzg3s_sysc_config_func() with per-function calls instead of
> > >     rzg3s_sysc_config() with -1 skip pattern, as suggested by Claudiu
> > >   - Extend enum rzg3s_sysc_func_id with L1_ALLOW and MODE entries
> > >   - Use regmap_update_bits() consistently for all SYSC accesses
> > >   - Shorten comment to "Put controller in RC mode and de-assert
> > RST_RSM_B."
> > >   - Drop "Enable ASPM L1 transition" comment (function ID is
> > > self-documenting)
> > >
> > > v5:
> > >   - Introduce rzg3s_sysc_config() helper for sys configuration
> > >
> > > v4: No changes
> > > v3: No changes
> > >
> > >  drivers/pci/controller/pcie-rzg3s-host.c | 90
> > > ++++++++++++++++++++++++
> > >  1 file changed, 90 insertions(+)
> > >
> > > diff --git a/drivers/pci/controller/pcie-rzg3s-host.c
> > > b/drivers/pci/controller/pcie-rzg3s-host.c
> > > index 44ce056d62c6..b7f92f5aee4a 100644
> > > --- a/drivers/pci/controller/pcie-rzg3s-host.c
> > > +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> > > @@ -111,6 +111,15 @@
> > >  #define RZG3S_PCI_PERM_CFG_HWINIT_EN		BIT(2)
> > >  #define RZG3S_PCI_PERM_PIPE_PHY_REG_EN		BIT(1)
> > >
> > > +#define RZG3S_PCI_RESET				0x310
> >
> > If there is any new version of the series, please put a comment
> >
> > +#define RZG3S_PCI_RESET				0x310 # Only for RZ/G3E
> >
>=20
> Noted for v8, if any.

Finally, this register (and other RZ/G3E-specific ones) is also
available on RZ/V2N (and probably other SoCs) where no driver
changes need to be made.

I would suggest keeping it as it is, avoiding the extra comment.

Regards,
John

>=20
> Regards,
> John
>=20
> > Cheers,
> > Biju

