Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE6F3B2482
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jun 2021 03:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbhFXB3b (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 21:29:31 -0400
Received: from mail-eopbgr1410132.outbound.protection.outlook.com ([40.107.141.132]:10847
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229758AbhFXB3a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 21:29:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=az9jhkVgoSOgqcBKnRS1lo+PVXRHCTGiF42lgglmzA7zmJ7cA+1OkgwL/ybLzVqCnyC6pEHKaJPlzYf5cZzYQ3WaqbTEqWZNNSjJf8UGvqcVuGtHi03IZWAjg6CYi/R4VOfA60RUbZh1/Gh8RnpF6myQsieHVnOQalk5QyKbICMrzrbq7QUy1Liwehdw8dqle/jI/D37hQ+2sPpZhvp1Q2BUy8P3YEQhJxy7wiXqmqd2uSnrXkfvX3ghzaq+l58UoH3gQAV+0zblC117RKw8SM2CJT+7RySqZMNMTaG/8xQoEyAKA9l/7Cd9qmbxG9QlTjT64usCz7SP+pjMnY+5cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AM58HfhNogHR6OGeNM5FNj3m7zBq8/IVixOGGWSvZZ8=;
 b=L1ka9CrDFmYm/GWFPEQq5u6pUUB+A+pkRUvMeQ1Gl8tj6F2dCI9kk2x0zNiQIzcbGHJZa9HWsPiaDk7AckJ7gs8xmiVOqUI02PfrHmV0xX7l62aw1tahq8qnoXOI9MZ/FnNMGMGE6n7DFL31WuHvvGJ5K5a6r4DP6daz7XA9k6dwOxBm8C/Woi1L0xpTmkXtnQrIKo1n0Dysab2fJ/Xei1KTJQPUUxFTBMxYSSsJ5c8ynZZlWmjLcgbwAf8IgJvltkNYxaivyJyqBvI63lXGlSCTnEnG3aaG//GW3TP6Xi7jkGxFtTMJ4U9waWc3GP+fKbtLnWRgl0LyS5SeCxiAeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AM58HfhNogHR6OGeNM5FNj3m7zBq8/IVixOGGWSvZZ8=;
 b=K4TbuMkSFCbsL0GtWeC7b2DeWVDq59yMFFvfEiVIejfcIOvoPlgrD8A7fmXI/bfnumoJWlJjujJOjOoagHr577wnIaisGRxSUqG5wFZ6JfUJTD0Dy95Q0YigGMnAaMAedBvbX18lgDW5JH40HDBGfTYhKOFTF+MHoO6iamhFUpA=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYCPR01MB5918.jpnprd01.prod.outlook.com (2603:1096:400:40::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Thu, 24 Jun
 2021 01:27:09 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5%6]) with mapi id 15.20.4242.024; Thu, 24 Jun 2021
 01:27:09 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: RE: [PATCH RFC] usb: renesas_usbhs: fifo: : use proper DMAENGINE API
 for termination
Thread-Topic: [PATCH RFC] usb: renesas_usbhs: fifo: : use proper DMAENGINE API
 for termination
Thread-Index: AQHXaBb4DCoFDFqLl0Gk0IEvbdRVSKsiXRSg
Date:   Thu, 24 Jun 2021 01:27:09 +0000
Message-ID: <TY2PR01MB3692C7B6E0FD027B5C3E05B5D8079@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210623100304.3697-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210623100304.3697-1-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f1280ac-d5ef-4260-02ba-08d936af2fd0
x-ms-traffictypediagnostic: TYCPR01MB5918:
x-microsoft-antispam-prvs: <TYCPR01MB5918ACAFBEBF5E8A580E6999D8079@TYCPR01MB5918.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gwXGMp2ph3ZCIKHKPPti1m1hmvatlb/LIvcNZULS3vY/Tzo+1RFEBmxnZZEMZaSJ+wPb27zvY1PUdVfMKUsyS58H04m6Jdok5CPCudi8X9ykI0TrobGKhI09UUZg45CvWR3aB6KmhiS04CZkImL22UrHHnWGV1EeNHV8DKMUrPTkX7ot6nWX1tRcJxFDWUBJdOhrNVizB9hMlBAm4l9KS9WVHo+/eVX4eCmuV6XCElkFGmw4lRl7Z77IiMrvBuTB/DeuxD0Q2NBoAEUMQ4nztQOTjpfUrLVCOT6G9V4kQfTw6Nl+WFLPlhur0Ee7KoFBsKzzpK7gkwP1P6yTDRYSbCSOVhe/cSHwhh7PQ7a6hR2QhZbXkralcMJRfL9Aet6EkYd7NtjDFhsYkKDtmbYIfIJZo5XpE4s8+VpMCa0zgtKg5GasqGRsulagjmAfhLe+2Ck22WGBBMMjMj1FRi4iD+0NhNtM7ZY8ty4By7GR1087ob3IbjD0hGuW+9BBixJtmnU15yIcQpdAoMkycZFSR60zpj9+OSsQcAtxoKnoBet3OgUqVUFO6tpuokrKYgc5oCUIx+m9a1Ns0lVKI1i8288j8QYlynryI8/XZkm5R6XwXpCS3UXdoBjH8O/jcq+xBt7uSkkgq6n60jfTNgmnUA7853ne/NYSnpV+c8FBHrrIC/oFfNqm6fe+/i/plJ/EG9FSI/4dlj8bl7MXj/TLzc2HhLfsQfDQ2/gL5mAfK4vBYfSvGYOcEjPiyrOrxys21KKHU7MQ9W+EWPvbCyUtmPTNtdMLuRkWTq+g3Ak+YxmFpQpFhpJLHYFdc+d+81qq
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(26005)(4326008)(186003)(55016002)(33656002)(9686003)(8936002)(55236004)(5660300002)(54906003)(8676002)(71200400001)(38100700002)(122000001)(316002)(6506007)(86362001)(83380400001)(66476007)(76116006)(66556008)(66946007)(7696005)(64756008)(478600001)(52536014)(966005)(45080400002)(2906002)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?r8TxsTdiiUNvrVWqK96u1IT8M2fjhRkVA4Pz4HD5naQ2mUYxdCzA4v57kLnr?=
 =?us-ascii?Q?bm8RakLA6iU4lnpJylugOUse2EybY2I2ZKRarUhR/SM0PHkIf0wCRYz9OdVY?=
 =?us-ascii?Q?+DcQeFEYJz3qyvEVMvidYA+D7gBjaCe3hncnteyDfE0TpOCTTD1WqOFsIQI3?=
 =?us-ascii?Q?eRS5KBlw7rQZjTxfxSynvNLcs48rNuVlJdralTp0LQHoPj/pyIE9mZgRV5no?=
 =?us-ascii?Q?2MUlw955sj2gdo9GtAggdFvlZbZik5xy10/hUPeqWQmxg2s3591MM73dY58r?=
 =?us-ascii?Q?EbhsRgv9vh2P1rIDcbea78LJGjmbDnWH3JlqEP+BTs4t2YF9i5uszUTfK+vj?=
 =?us-ascii?Q?KTuVXdiCIG5PRGaYKdyc6pDBM1kvYV3amNIYTA8B3y7XJbcCIeIFhLFx0nOe?=
 =?us-ascii?Q?qlrU7lNe7uTEYoacWzXUx3WLEua1vSNL+rx09ZiYW/WvwG7hRvnMKp3YSZKD?=
 =?us-ascii?Q?ZDdURC9rM/BUTbUzbCo/HhxdBIJ9/wgKGEFyY8ITQArX6hyuSRPfhjTnn0CZ?=
 =?us-ascii?Q?W7StuNNIRcMB+MQ2oDn0tegpDAtQWSc0rZd2F/9RNtw4aPu9ohuRoil7FSsW?=
 =?us-ascii?Q?qtnEda3q5YkEgbHxb9meDnATx2b81mDsZdv+1Mdis1UcmJv6prTG5ikbhhBl?=
 =?us-ascii?Q?h3JCBRqAvCHxNQKGcvgkqwsB1LPFXUrp2/kPr9bJQrO0Ia1jdkcrnmvcM4L/?=
 =?us-ascii?Q?OLNSAKYeodqrgbzVe4LIbfpH165TINlfF4YBJimRKOmSpVQnbD61LdzXngA3?=
 =?us-ascii?Q?V4drJ4fCTYjWYnTkh5iEbGjMwMi3THzzQaw1hlMfAIUWIEZZIsuKsxeEjyS2?=
 =?us-ascii?Q?VHLR+bwCYjq6ZF2f0Mv9Nv5wi0WNyxqiqgCE9s7ZPhReb+lECnpxDJ5xOY+N?=
 =?us-ascii?Q?+RHHy9gZTXi8LlgUxhcUDOVmGmBYEPomtO8Gj85OLiXAOdvBDssuwqkT6Pj3?=
 =?us-ascii?Q?bZVWcHfuq7vEiadTDRV3OEoCgYWuVFcOb3DnAauSZheEX9QYbKDnvMATG4ih?=
 =?us-ascii?Q?BlYqu5s4R+TyvX9SjRp2XizYJwNYIRK4t41b5sfP4XtJbqWNVeeSgGQD3jjv?=
 =?us-ascii?Q?G/JJCPdpkPuxyaKPH5kFrPpALJPkWq5KvQyWAamqTKxYOuwZuz3VDITUtFpj?=
 =?us-ascii?Q?Arfm+7FzZR+i3eBOjeUX9Pj0evNj3/daHLG9uJTpo/T3rE90WEd9nEaTExUh?=
 =?us-ascii?Q?nhsqSm50lH1D8LOrfGvjWW+lhkyrfKqSiS7P4aznNiBtwKYTKc/u7apcct9M?=
 =?us-ascii?Q?NRnKJ028U883RIwtoqsxI6lXyW+Bh+fmpPWs6yJIBLtFH/D3paDR5u0vgq9Q?=
 =?us-ascii?Q?qWWcUCBn88+6PsKLTf/iQ2tw?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f1280ac-d5ef-4260-02ba-08d936af2fd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2021 01:27:09.8194
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oBQCb/RoqUF/N5Mp6ymnTGEQ5CCDvxxvGAwgcwva01+pZu8TKsf6JWuP4n7hn1oMaWh20pQmL7Z4UdAit3sW0B+y/akSG0DhJ1qlqXGi6ZXAev7DgFOMx9R8qaMCEztS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5918
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Wednesday, June 23, 2021 7:03 PM
>=20
> dmaengine_terminate_all() is deprecated in favor of explicitly saying if
> it should be sync or async. Here, we want dmaengine_terminate_sync()
> because there is no other synchronization code in the driver to handle
> an async case.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> Shimoda-san, can you please double check if this works with the
> additional locking in this function? Thank you!

Thank you for the patch! I checked and tested this patch and worked
correctly on my environment.
# To be honest, both shdma and usb-dmac driver doesn't support .device_sync=
hronize
# so that _async() is enough for now.

However, I have a concern which this patch will conflict my fixed patch [1]=
.

[1]
https://lore.kernel.org/linux-renesas-soc/20210611105411.543008-2-yoshihiro=
.shimoda.uh@renesas.com/

Since I caused a trouble [2], the patch [1] was not merged yet.
So, I intended to resend the patch in near the future.

[2]
https://lore.kernel.org/linux-renesas-soc/TY2PR01MB3692555C6EAC8F02BC8B3D63=
D8329@TY2PR01MB3692.jpnprd01.prod.outlook.com/

In backporting point of view, I guess it's better to apply my fixed patch a=
t first,
and then apply this DMAENGINE patch. But, what do you think?

Best regards,
Yoshihiro Shimoda

>  drivers/usb/renesas_usbhs/fifo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/renesas_usbhs/fifo.c b/drivers/usb/renesas_usbhs=
/fifo.c
> index b5e7991dc7d9..6176f2325f03 100644
> --- a/drivers/usb/renesas_usbhs/fifo.c
> +++ b/drivers/usb/renesas_usbhs/fifo.c
> @@ -121,7 +121,7 @@ struct usbhs_pkt *usbhs_pkt_pop(struct usbhs_pipe *pi=
pe, struct usbhs_pkt *pkt)
>  		if (fifo)
>  			chan =3D usbhsf_dma_chan_get(fifo, pkt);
>  		if (chan) {
> -			dmaengine_terminate_all(chan);
> +			dmaengine_terminate_sync(chan);
>  			usbhsf_dma_unmap(pkt);
>  		}
> --
> 2.30.2

