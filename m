Return-Path: <linux-renesas-soc+bounces-7011-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F29A924C7E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 01:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D09112839E9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 23:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B9F17A5BF;
	Tue,  2 Jul 2024 23:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Kcbd3put"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010067.outbound.protection.outlook.com [52.101.228.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6701DA32A;
	Tue,  2 Jul 2024 23:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719964748; cv=fail; b=ooFlRXDK88+yD7nVcQPeHqHqQkfFfneeHSsW5kxGddse/F8Ra9yK2PbNSagtj2z2JDoa7AoGNe9AlWzKzpRWBQuiBnv897yQLWRmEQaF2BiuIgUwJav5AaTdSEvMDzyAF1gNBhb0uRX7LBdMHJUgy8Y/IDhmVvXLyWrM6LLjrew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719964748; c=relaxed/simple;
	bh=1R8tHMo7UtScG+4Iv0PID4bmxP6ts1pGulnBCB/aNhM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WVQqfkUHTx0A6KIVUIToWE8KzU98YJmuPWtp5KdZcsVntBeLToOAkIbqqDgGtxa3T89VX7JZ/V5OLfx3sdYENM+f0cJeUNvedkYqkm866Bgi/J6hv5l9Jq38wo/IjIYtyZtiCrHuEwFnVYUHJczMYCSoTy+XsciW3IA+eAfPb8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Kcbd3put; arc=fail smtp.client-ip=52.101.228.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mo8GIQqJ0f8O6EEOFkI+yB0Ea3BKP8Eopipw9P6XQ0P8fjngSDICba87sFOKMJSNCLM2s0xiXsaeriBC1JMQ+4OgGtUlXZhk2rGA1MeAxFW1nlFq4El+LClAcexpl5E5jchY9d4Em7bbK8QlcxwuwQrmKnGfSdPrFl8xvHXtHXZ9Sc85Nwcws5dy7fPTwVVcTn6kK4HlkWZ9pJ/+WfXnaFqnypfuXep1luthipwgzdunYWlSkz73jGgrfhAU5OZTKH2ZhJDFb0CpgpSja16Bo+2NHVhcW9hdwsj3abK1ZIwLtkA+Ql8u4kzDYjpB7EMOBMxKarxmDyXG3QfP8vlMVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/BS/hpnUkiPoDOeEV6Gao02Z7UnJZBHaSwGyBoKwoo=;
 b=M+KgeHQmbkCBRNjkAJmUmqmuoRUJqtd0AObj6XxlvQZrOO8yohRXBrlE7FwqKJHVMP53oC8PYJheDoD4OYlWtQoT7icziIG5E4kGzqGARyQvySxqoUZJgGf4Ljq1ins/fd6/cL+6uCN81S3zIbs18RzVrhLTTcB2ZIAOMckt5FxrEGhO5lOKX0wL4uuq0sRWR4MiMD03CX/92ImehWlYgyNGgOgSzSQc4Ssh2azRIGHPwCfD470b3eumb1JZkZXJybG6JYcoKPi1lHbXjJ1wE/gq/6seoYZaG9FZI9oeAzqWKasRR5CZvB/vUPsxchPTG6AlxjV8eidKrCSzAGQgQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C/BS/hpnUkiPoDOeEV6Gao02Z7UnJZBHaSwGyBoKwoo=;
 b=Kcbd3pute2YHZcAdAGfpYeF1mzMfLnrvtEMAkjH9vUXNVasshZSh0T41Lcel3GQMZHocGf704r3RAM3G3cRBurlR3/fpdp0ciPunEN8lzy8BxX7Nb7gXPt5HnF5KOR5d+kx/ka5+itACA0GiAdqZGmbkFqqGtwChak1AYDNC8co=
Received: from TYWPR01MB11030.jpnprd01.prod.outlook.com
 (2603:1096:400:390::11) by OSYPR01MB5399.jpnprd01.prod.outlook.com
 (2603:1096:604:89::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.34; Tue, 2 Jul
 2024 23:59:01 +0000
Received: from TYWPR01MB11030.jpnprd01.prod.outlook.com
 ([fe80::a78e:aecb:953:b562]) by TYWPR01MB11030.jpnprd01.prod.outlook.com
 ([fe80::a78e:aecb:953:b562%6]) with mapi id 15.20.7741.017; Tue, 2 Jul 2024
 23:59:01 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Radu Rendec <rrendec@redhat.com>, "David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>
CC: =?iso-8859-1?Q?Niklas_S=F6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>, Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] net: rswitch: Avoid use-after-free in rswitch_poll()
Thread-Topic: [PATCH] net: rswitch: Avoid use-after-free in rswitch_poll()
Thread-Index: AQHazMQJMQWo0lPLVUC90F8UAy942rHkHcTg
Date: Tue, 2 Jul 2024 23:59:01 +0000
Message-ID:
 <TYWPR01MB11030052165C031FD5FF843BED8DC2@TYWPR01MB11030.jpnprd01.prod.outlook.com>
References: <20240702210838.2703228-1-rrendec@redhat.com>
In-Reply-To: <20240702210838.2703228-1-rrendec@redhat.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11030:EE_|OSYPR01MB5399:EE_
x-ms-office365-filtering-correlation-id: b43b10f1-e991-4aa7-6971-08dc9af2f24f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?guhW4XzjD7ZMaacsUDRZgiCIHd+g9z/7dslnj0mbb7kt1mZHDZSzBKR7D2?=
 =?iso-8859-1?Q?zUpLEnlTsBxBNphSF+dLzuRruxr9OEMiyjycbprA+FARbm27xdMJpFRc+r?=
 =?iso-8859-1?Q?Cb9FTII0cFO+gBgDEF38UGt2Tqf3bNcIbK+Q04wnhCwazrKBJEiY7yr/s9?=
 =?iso-8859-1?Q?ooOKX6wwh2N4bCAWbW+lIknDzjzJF/pqy2T5Dax78BBFnu8rZlm+TD3TED?=
 =?iso-8859-1?Q?ji5qJxTjipyshcSBa1Oo3GCkJ2D5HnSJ/V8CfF7bTiWDmNFBkPf99AyjoE?=
 =?iso-8859-1?Q?rREUL7VCH3EnW6LnEh0q2Vqq73rnm/Lb5BrGFI/eBC5inn99Kv81WtW8Sx?=
 =?iso-8859-1?Q?abtPwlG2W9ndhpZFlaTZ9M+rYzSkR3WUkfuQJzQXERqLn4MbukrKd2sian?=
 =?iso-8859-1?Q?vO9zA9iPM+C/KVYIOD2g7XuQfN1Jo1Wn8NuTGqB9tHC2ObMI1o+GEdx9VC?=
 =?iso-8859-1?Q?eqdd/mLry5sfrVdHU877AnztGK+1ZNIYHg9aIxanABkzV8JhjH3B/Ed/RZ?=
 =?iso-8859-1?Q?AyPD8DGUMUXJs+1+i29Fg43dwaZXTW3hwcKNweIy6r7kxSj/Slm75Z7OD4?=
 =?iso-8859-1?Q?/Jwt1I0J6VC29P96UMjKdzYWQX6PrR3A9YNDz9QS7AWbnPQ6nUbQRQlixV?=
 =?iso-8859-1?Q?Qd6ftvriAgVYCPoavk2c31ubnNVFQi30GAFR1Yb9s2Blqf4Vd1sGsJ532V?=
 =?iso-8859-1?Q?HZDaUzD+x2lV6WHafLnjOwM+w3JKJctjDiSScX7ZqVCsE13TAVm+9WkrX8?=
 =?iso-8859-1?Q?K80gpC98+YU4QQSqZFWet4whpTXdwcpuXAkNcKaCjT0mIDBkTG56yewttz?=
 =?iso-8859-1?Q?mmJtMLDUS3pA0ifr+vsmRKO9huWNEV1hQgd+UVZst1onQLRZS+DronXX7t?=
 =?iso-8859-1?Q?KMMuFI7jRNQiZwizHO0hILcpzAmpBsidwF0/PptIUDhVcULTiyDnjNrChD?=
 =?iso-8859-1?Q?GHi72P57triaComdEaZPGBjLYExDiQFPdtW5EG1qTCsGH7K2ZJSpqJh67E?=
 =?iso-8859-1?Q?pOwk1Xj3Qu5sa5qGfb8MH8WkL0z9i354yTg2Yha/5u7HDrTLZ50ssUiZjc?=
 =?iso-8859-1?Q?you8LHLuACFILPdHTgiV9JkYMz0eV+9erwxdf+kDlru+aneeNSoiXWsTNA?=
 =?iso-8859-1?Q?YJASsg2BaLcpf1mVP0vAPqD12GIKbbkZXrJ3ZCl+VSS0X7tWFwhOHZtbCw?=
 =?iso-8859-1?Q?ELshYzhZsiWsPgMc1IuVVYkrOHxJYRiMNfntdO4lDvylR+ZJpATgREyHGp?=
 =?iso-8859-1?Q?wmX41AnPmQizV4J4hjBxvM5NszTumgDDlOkDkK97xFxSt1MIBzyJTrqu9P?=
 =?iso-8859-1?Q?JDhwj161EW6ls5zLKDJUk9AT3/BLqIX3IIjiyHtUxJwi6Xx7uYsixymIOY?=
 =?iso-8859-1?Q?R3zv71irFDJbY4Qe6QNpwgAXB8RsI3IRdxpmKuW9oqt/meC0rbN4OpPgPH?=
 =?iso-8859-1?Q?KI07WAYf5JLdIyeivDL4Kb6TE1dILyKD5gbIdg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11030.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?NLrdZvnF+oQca01idOUqD0V5FIgiFpK8X9+ukRCSSq7pFsESzfQBedsYg2?=
 =?iso-8859-1?Q?FDqWaz9zMdavC7fMPCs7JHIvwLvYA8GC+N5kD4ANLH5VCl9R+fOM6wFwu8?=
 =?iso-8859-1?Q?3GZwUdjYPRGistXEEetXCu5d+i482OV1Cp73zsdQ5+RhIHSSWIPyCB9Oul?=
 =?iso-8859-1?Q?7ZPdJhzfWpLSqmmSSTo34nkaeeshzxEDPG2Or7tswM29P5oiAlykIriZc9?=
 =?iso-8859-1?Q?oeNU3pTMdFYApxfgeh/ZsvS8UAc4BbcIhzJrepOt6CUYeD/PqlLrGlkkR7?=
 =?iso-8859-1?Q?AuKVQg+1dNRkiIimOwawj0vRGauemFq2kBZinVqGmw+jVxCNk1n3XKqyZC?=
 =?iso-8859-1?Q?UsQmSXQUf1n7H8EkF6gpH0omnaT5THKUzu76vnXuxBRJ0Log6UO1xMlan8?=
 =?iso-8859-1?Q?NLP6YGQtYkasdZAX7yHvHebVZDy4U75+jQh70nV6B2AcvUAGJyrX1YXb8I?=
 =?iso-8859-1?Q?6L9p8tmHdet3Wa0iIrVR945+F2igefE6mG2rDzzLIuQvx3d54Kma7f3Ow6?=
 =?iso-8859-1?Q?doh5MlMHPzDUkKIDaBHRk0+05FL+ZfZWyM4z04dk83FcfhSvMRa2DuK0eo?=
 =?iso-8859-1?Q?DLQevdqk35c92SyeCXmz+/gnDnN8vfoBWKFhfnNP8hxta7MBwCDOqWmCgk?=
 =?iso-8859-1?Q?ACVj0JlJsl/VLFqh169E3L29yvpiJn9a/up2kuiVuy54RELAGSWxrvMzBE?=
 =?iso-8859-1?Q?u4/GBpGfy10RzjUqBObyRrNuks4JEuDv4jUSvgDH1X0RIM7vG7XHg0/632?=
 =?iso-8859-1?Q?OkgdpijKRyCIc+MfpCmdEKqRFYVooIWJrCaK+fFOI//ud8JQj1KpZgRNwA?=
 =?iso-8859-1?Q?RYcTKyjg45OsG9+8DB20/TBwn84+LhqktB4WOm2Z5QhUT4RJYT+ltlzIMd?=
 =?iso-8859-1?Q?LCYoXQrk7Ebfw7rl2bSlBtbhortRwMA/VtAic0K6qq9gQtJ2m6OeYMkbt2?=
 =?iso-8859-1?Q?0Z6xG+tS6lyCW+IMT96yj+jGExWrXlypqPsYFQbuCyBbj7PRNe7htjFoDd?=
 =?iso-8859-1?Q?e1EzFXYPE3B8Bxwap8yFTaaBi+QR+5eA/pKCRbupPwX9XnQWPvlE42kVnf?=
 =?iso-8859-1?Q?zhz9yNO22g5waZa0WS7bXaiU40W7SNleWbqPGiOxTfN3XfUw21Fd5GKhWn?=
 =?iso-8859-1?Q?hE9YxroPEM25Vr+NgSvzOb0D89FUdKGkxFQpc5dme/m6tAYcsb1Ck7gDDY?=
 =?iso-8859-1?Q?0q2yrRHk/NK3ICF+lT6ujUAyj2fMM4UY6rGQOJTt9bSIAoIZesWhIyxtYv?=
 =?iso-8859-1?Q?Fu6rgXC4zrZMAPrCnHAj8RHo8teZCXrJa0d7Xuva1EjlljFZ2nbGhRMKjg?=
 =?iso-8859-1?Q?WQ1XmZZRJ6/XMwE5mjSgv7m56tnPQL6uoIzpAO0+9Jjvpnjnn5CVbRJFnk?=
 =?iso-8859-1?Q?Ib7G9iDybC+bOONl5cqFaLtmbe3NlifzhAenjwiiSmM55V47qMbiRht+1r?=
 =?iso-8859-1?Q?TqVdmXcniM8KMeTAlUCVuLi+uIS7/iqj5t2uiATTkPpOkt6Ou31/EEY4YK?=
 =?iso-8859-1?Q?x0bpPimU+OJfLGoOha3Wn15hF4xzcoBeUhiIRTVSV2xLn8M3euC3gshTwl?=
 =?iso-8859-1?Q?DHDwuZAtBUzD9V7nqkbKybRinyjJGYNnr1RtvwSFQiZ1bbSOvqaNPO596M?=
 =?iso-8859-1?Q?JM95csGXkIyf81DMq6VoauxcJEA0ErXF/8Kjs/M3d0dbsxHo7ZdRShhN95?=
 =?iso-8859-1?Q?wEPvw8FbI9FQMlwBkhG7qX1/FMXiQT8jqm1yIeaCj9OB2Ucuy1NBeFRgUG?=
 =?iso-8859-1?Q?IxRg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11030.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b43b10f1-e991-4aa7-6971-08dc9af2f24f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2024 23:59:01.7596
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EYzfvFKNw2B4oj/LZ8hwnhbCCrhjDnFWGehXAFPTbaXVR5HtOPhpr6GbuMTPO68kyNYYDfwfdFcJbtteZaTr1lzqg45umzcSKQDC3VloBQLuIxGuNYTPcUHUJUXiWfH7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5399

Hello Radu,

> From: Radu Rendec, Sent: Wednesday, July 3, 2024 6:09 AM
>=20
> The use-after-free is actually in rswitch_tx_free(), which is inlined in
> rswitch_poll(). Since `skb` and `gq->skbs[gq->dirty]` are in fact the
> same pointer, the skb is first freed using dev_kfree_skb_any(), then the
> value in skb->len is used to update the interface statistics.
>=20
> Let's move around the instructions to use skb->len before the skb is
> freed.
>=20
> This bug is trivial to reproduce using KFENCE. It will trigger a splat
> every few packets. A simple ARP request or ICMP echo request is enough.
>=20
> Signed-off-by: Radu Rendec <rrendec@redhat.com>

Thank you very much for your patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> ---
>  drivers/net/ethernet/renesas/rswitch.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/etherne=
t/renesas/rswitch.c
> index dcab638c57fe8..24c90d8f5a442 100644
> --- a/drivers/net/ethernet/renesas/rswitch.c
> +++ b/drivers/net/ethernet/renesas/rswitch.c
> @@ -871,13 +871,13 @@ static void rswitch_tx_free(struct net_device *ndev=
)
>  		dma_rmb();
>  		skb =3D gq->skbs[gq->dirty];
>  		if (skb) {
> +			rdev->ndev->stats.tx_packets++;
> +			rdev->ndev->stats.tx_bytes +=3D skb->len;
>  			dma_unmap_single(ndev->dev.parent,
>  					 gq->unmap_addrs[gq->dirty],
>  					 skb->len, DMA_TO_DEVICE);
>  			dev_kfree_skb_any(gq->skbs[gq->dirty]);
>  			gq->skbs[gq->dirty] =3D NULL;
> -			rdev->ndev->stats.tx_packets++;
> -			rdev->ndev->stats.tx_bytes +=3D skb->len;
>  		}
>  		desc->desc.die_dt =3D DT_EEMPTY;
>  	}
> --
> 2.45.2


