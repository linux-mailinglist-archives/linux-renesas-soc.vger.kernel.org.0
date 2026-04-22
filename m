Return-Path: <linux-renesas-soc+bounces-31482-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIjyAhBq6GlZKAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31482-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 08:26:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DB4442645
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 08:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 879233004D0B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 06:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3DFD2E2EF9;
	Wed, 22 Apr 2026 06:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="sdf2Ksz4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010038.outbound.protection.outlook.com [52.101.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAA617BA6;
	Wed, 22 Apr 2026 06:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776839177; cv=fail; b=pTwVGr0qLbA5HT2YS4P/zvaPvhOhywKMR7vyUTlPLDv7eqptWctvjoEGxRd5ombgME5C94p9qXc8Y/XjuAHyHZXe+iaG1JRlwKKQ2beWZkZvy6TfXqauVddsqLHufA0/FPnNB0WTUX5wXLiZx5KQw0iBHdidsFgyXNZtp7EIr18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776839177; c=relaxed/simple;
	bh=5mOjWO8MPUyOF56ZteT9VsfpOcMFUU2+PVf0Zh9vSPc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PDqDEUWlKbxNBF31Bd83DPLNTl55lyOeiwlQSWVH/BYF9ZnWFvYAefLm5XYQH3Q9XJIGCht0uDYKU5Fq5WYxQZesHJ7Cv80rf6BzfJ26Jbqh/iFo8HaxPtLUKlrsZ/3d1ONFDitXHQj20N8zH22HDVLk2hTl2/AvwzaUUb9Iqos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=sdf2Ksz4; arc=fail smtp.client-ip=52.101.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RnRbRlajieRbNYtFtmWRTS4xiaUPCVvz5GFX3KlNncJxLxEBd9zVpKqkrxwbKk05J81i6CnNZzXr0zAjub064yoDdJHnWzA8LycTYMh/FXYEvp9bsQWoO7S4diLbfx4NU0wTleTE8Lcltr9ruZnWJ0fozb9Zan1E8xDMgNWsFwAl0Ks1Tvm3WsEUKRWWt9GADIlO6K+spd9S2Q3Spj8BmNoFUe2lYK3F0gCCi1qBXojF6Z2ANM4ku5IVB1uRlmiiHLl1TOUCpSSXzJSNSc4pVuBAEkwFMmt5CS+1X9vpM3r4ZNbjdVg5Mwg4aZiNAs/oHx4J4M4jjEEUvxqb4hzMbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c54cc49Xwm8kd0VPbEmPC+RwqztmJap68P1YgkVUiSM=;
 b=fyavbJj305/qyCxsQToT4VI9qy/sn41ka6WwCREDJe38ZkIFXI/uaIzSK94T4ztzhTRYVOEoRcaOdj7XYd2/MdvNXYucs8sqQNXJ6hP5ZvDIu2V37kPtenFO08cVtXC/zztn0mIy/7/aSkEe85/TZ8uYxi+pF7ZuxLDiaNkfTJJQ7ptMramGKXMEnSLRzdq7opeaY9UP5V2Ku+BIJkO9upq/MJra78wLRbpjBZVpr8f9H+6jC+Y94gtMwYp6PFuu2sVxSbux+5i96PeNM7c1VhWpmSEkQHkNbP2JSoYA/65bnou6dBIJa1LbluI/agLJcbg3a630HYEmskPn52r3FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c54cc49Xwm8kd0VPbEmPC+RwqztmJap68P1YgkVUiSM=;
 b=sdf2Ksz4rzQq0cq7fVyo7G+VP79au57KjQu95nVbEZmdVLps+yUPgBrxiZfuXPLZFVuqCEw1grMGh6V8V8HtlQIN7DbiDKdjBpm/TE9a1BiuPQg19kCN3wJMoRyls6ipK9TK2HOIs1CyKnIpl/PryuhN5QGYDdIGcfDtfi6sGdo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB6788.jpnprd01.prod.outlook.com (2603:1096:400:b3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Wed, 22 Apr
 2026 06:26:13 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 06:26:09 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Bultel
	<thierry.bultel.yh@bp.renesas.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>, biju.das.au <biju.das.au@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 3/3] serial: rsci: Refactor baud rate clock selection
Thread-Topic: [PATCH v3 3/3] serial: rsci: Refactor baud rate clock selection
Thread-Index: AQHc0M6fxD+X2AJKlUClIYVQS3QtkbXqntPA
Date: Wed, 22 Apr 2026 06:26:09 +0000
Message-ID:
 <TY3PR01MB113461031F3FA4D576363E5AF862D2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260420140426.237865-1-biju.das.jz@bp.renesas.com>
 <20260420140426.237865-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260420140426.237865-4-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB6788:EE_
x-ms-office365-filtering-correlation-id: ce1eb5a2-a0f4-4ce3-9861-08dea0380af1
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 rt1MH1WFV4mwdfdhru4W8eD7zFoz6JIgh2H1OvrmUclC3OL2c8z2AjKfl3xf9uHfnTA3fsD3PWhqPdLQkKZSArc2B4gU7dONXhuxZvMo8LbAz/GTw82j4U31BEWIk/55/XQCSszo7NfzV4mKQrOz1Kcva5QtqkhT175m2PCKWLr05jTL+xt6r7sJznWS3YVy838z7m+nqRkCOOnz6JCDWLmjEF3uZRF9/QcPyqm1fiwCc8v6yDpnPYOf6gZmBtmWThQOac+ljh8av0IqpgduiJlUSB1Krv8xlsgVJmJcC2Zbh6RGh87moq61mkdUgVKtvXmEIlWliWKzBenjAABc2HVAtRpIHGXmlzzf7pYBA2zY4K0DmNPW9lwrcwh+x0yVZONCXIWnfo1EeYpHuVxa0r8EZwUDvRr2xfr4o/QQDxPptExKN2g+bXqEo4TT8yreAkx62jOq6q2U7hg7CYO06cJ1Z2+H0NwRfxQlDZSZ8DB0oho8vkhp3yo8CKWqLzKa7Hy6APDgvqSIMTEc71LLZbIcsJvoa4lfJLsFgloT0yomSwni7iQsNOdA+Bg024/YaivXffz6pXZkgcEugVaCXmsr9hM8gU+ftr0ZVRf435x34woTOP9KMivLREbw7IYqjQDULH/3+ywmqnSNz+tvZiSvzn13U31tcOAkpGGtxX64AWj1Uv0z/nLYTg1QMqqzsumFmDKt5qcyShIlrpwtEJinbrZZYvhYptwcBb+r0ZXBWCn6eEJ44RBC9F15c0df6saxBBrQhivmc/5lYJAt3JalM/oNofYEtSyJDu+4CEE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qHoY+G9S9zs/GJHbZSgvkMnM5aAAKDhLASv3jG7jJAHUNxNsr1tcFRKz9bhw?=
 =?us-ascii?Q?17yJAzVHLaaW/t486WT0giBq6duVyRobaVgJWhcfNtVuRCLyDrN6IOy5xGJc?=
 =?us-ascii?Q?3gR7d1GopZXA39sbDAWGbxLfvJwDGMRexAKajQIi2aHbWkM4SoHyUI4Mpq8J?=
 =?us-ascii?Q?UARUvuXed2YX/FlmHpAy0nKvm7ZM55qPgGcQUXscbgj2/2wu+bTsVSNY+2oo?=
 =?us-ascii?Q?gWGRiD0DmieDxE39eVMNmyq3F31F2i0LKv21nRHCUJDTRaPyEWF/LrSIuci6?=
 =?us-ascii?Q?Did7nqvv8f3nvdH/TYBYw3eBHuPFwzPHPMmyBNdssjXr4czTDtfYjq6mYk/a?=
 =?us-ascii?Q?/ronYl09giHAzfQmUvxWrfR36Lkg9ezZWyTGgY9W/u915x2ip8M0mn7jGRB5?=
 =?us-ascii?Q?9H4+KLoY0mipJ/zwFSQYahvfu4er6B4GereRaDW9jO72Z+ibP9CIagLaxdOn?=
 =?us-ascii?Q?wE1xXs8f0ACu6jKK4ocsxyJ+332NhRlKjvvE9hEgA4vEPVaD4M5bTrD7itOq?=
 =?us-ascii?Q?/W4h4M+oDVRMNO167nOslw0Jp9tsz4kLOiXG5SmgFTPmzAtTBo9GowGWhrzP?=
 =?us-ascii?Q?cwQxs8xyJovkRAirOhRrcwkC1vxUJ4HgzyhsouncvXiZPZl/sWb5+LHC8eWm?=
 =?us-ascii?Q?PGagXvIsRha5cFloYjXcCEyRnwpxhUGdWHQdRKyDiUvB323hB0ilGEup/293?=
 =?us-ascii?Q?nUM6K7rNjCGrENtpjxkE90Z3NmMDWCmfO/4Y4LyOY3RhKs81eioN7E5IXSw4?=
 =?us-ascii?Q?ppCDjU4l/BgwV63znQz4lZ4B3/i5G1K7vgNogP5TMG5PysHpS2WkwIBckZ9d?=
 =?us-ascii?Q?IFGtcOBro9fdt3ooiR4ZofqUKq9hNc+jBzQyxJIdhhUJPAuOF1pZaPjhfyfO?=
 =?us-ascii?Q?zECAs/YC8/E+6/HIwXOcv9ntGL6B6/1Rps9xppxC/dou6KVpd3QfSOprh0wb?=
 =?us-ascii?Q?R5uumtJQOPrs9ZKpR02vZb/bIifnqS9A3CcIw0rUC19G23WBS2snO9uPeafW?=
 =?us-ascii?Q?mWxoi4nlPoDeH6ENZWYI6XBW+vxB/iB1IlhiV+SmnriWyWGKgGm1Wcp//cjj?=
 =?us-ascii?Q?S8+S3Y1sX9xW/7wSy/NfGPKFVC/sab5RleZ1eL11wkeKhhl4lVK6TXj5PK64?=
 =?us-ascii?Q?hChYIxwOeDtnnQp87ii/s3RgT1lEoAB+9UW1V7TnihPOjJt2cTPwlGlBtWp0?=
 =?us-ascii?Q?QkSTHR8/EUR9y+k5+1waVEOwfJo5nvzUxEaMsMXwHfdm7QLYM5k4z+DkL0+R?=
 =?us-ascii?Q?pygBUA9GG5dgRaS1CXeyXV2Lixbk7rZIc0nAD3NOU54PfCruBvityfbv3yBM?=
 =?us-ascii?Q?s1z9Xga0JWb2hZ+o2eTxFz03zMxYnzP/27OcBEqvnxcj1zhUYoembbgiLc56?=
 =?us-ascii?Q?j/MuSC8HAX/XrjwKvZ1m1tP0jIEyEcuwmYqOI+NRjUL97ECsTmljlDwp0WkZ?=
 =?us-ascii?Q?DO1QmPsjjKU40xIaELpdOilhnU7SEHrbIKu7DaAA16SlbfwCVIDKY3Zc9Mxu?=
 =?us-ascii?Q?3pN+Qvn7/Zi4754x+JyY34NaJ2dAC76PQG7YL/b5kMMeI2rrMFGA6ClZGGWh?=
 =?us-ascii?Q?GPN3yh7d+HmdPt4arQ7wum1DZdFGRJ31VVAeOP9ytBQmFKct6Ss6iSPKVu++?=
 =?us-ascii?Q?ecYppOKvhsrbt26YjCLZn3J7EmbLubQo9DJiWc/YvFQ8rrCY+3rP0cCiOTbK?=
 =?us-ascii?Q?5oqLO1mm0AQ4Dvi3Wv/MzO8IPuKqybrDqdEPEGCs9SyteXUgusEoXszuyC9c?=
 =?us-ascii?Q?GEt5m+ogSg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ce1eb5a2-a0f4-4ce3-9861-08dea0380af1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2026 06:26:09.5324
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LA/MN6rNVsJ68yGhvNQXxijF+8W8/JHS+eR3T2AeXVMyWquvKCboFZu6COnzWPVx36y8+Ttgh49zwoAZZDH/oHYUaPE+FnnSED/wm93DJ+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6788
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31482-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org,kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[glider.be,bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: A2DB4442645
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 20 April 2026 15:04
> Subject: [PATCH v3 3/3] serial: rsci: Refactor baud rate clock selection
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Since RSCI only uses a single clock source (SCI_FCK), the multi-clock tra=
cking variables (best_clk,
> min_err, brr1, srr1, cks1) are redundant and removed. ccr0_val and ccr4_v=
al are likewise dropped,
> replaced with hardcoded 0 at their write sites, as they were never modifi=
ed from their initial zero
> values.
>=20
> No functional change intended.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Dropped reported by tag as the goto statement in rsci_set_termios()
>    removed in the previous patch.
>  * baud check removed by previous patch.
>  * Added missing macro CCR0_RE while dropping ccr0_val variable.
>  * Updated commit description.
> v1->v2:
>  * Dropped the check (abs(err) < abs(min_err) as it is always true.
>  * Dropped the check (abs(err) < abs(min_err) as it is always true.
>  * Dropped variables best_clk and min_err as they are no longer needed.
>  * Dropped intermediate variables brr1, cks1 and srr1; results are now
>    written directly into brr, cks and srr.
>  * Moved dev_dbg() inside the if (baud) block.
>  * Dropped ccr0_val and ccr4_val, replaced with hardcoded 0 at their
>    write sites, as they were never modified from their initial values.
>  * Scoped variables err and srr locally within the if (baud) block.
>  * Updated commit description.
> ---
>  drivers/tty/serial/rsci.c | 31 ++++++++++---------------------
>  1 file changed, 10 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c index =
40db9daa4272..444e89696310
> 100644
> --- a/drivers/tty/serial/rsci.c
> +++ b/drivers/tty/serial/rsci.c
> @@ -217,16 +217,15 @@ static void rsci_set_termios(struct uart_port *port=
, struct ktermios *termios,
>  			     const struct ktermios *old)
>  {
>  	unsigned int ccr2_val =3D CCR2_INIT, ccr3_val =3D CCR3_INIT;
> -	unsigned int ccr0_val =3D 0, ccr1_val =3D 0, ccr4_val =3D 0;
> -	unsigned int brr1 =3D 255, cks1 =3D 0, srr1 =3D 15;
>  	struct sci_port *s =3D to_sci_port(port);
>  	unsigned int brr =3D 255, cks =3D 0;
> -	int min_err =3D INT_MAX, err;
> -	unsigned long max_freq =3D 0;
> +	unsigned int ccr1_val =3D 0;
> +	unsigned long max_freq;

This needs to be initialized to 0. Otherwise it will compare with=20
uninitialized stack value on else path.

max_freq =3D max(max_freq, s->clk_rates[i]);


>  	unsigned int baud, i;
>  	unsigned long flags;
>  	unsigned int ctrl;
> -	int best_clk =3D -1;
> +	unsigned int srr;

Also, looks this needs to be initialized to 15, when we drop srr1.

sci_scbrr_calc() fails, It will print uninitialized value

Cheers,
Biju



