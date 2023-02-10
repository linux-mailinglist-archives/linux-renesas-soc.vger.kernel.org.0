Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6755F691903
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 08:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231284AbjBJHPC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 02:15:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230161AbjBJHPB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 02:15:01 -0500
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2096.outbound.protection.outlook.com [40.107.117.96])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE3826F220;
        Thu,  9 Feb 2023 23:14:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S394uzoGYpBO3f82ZFxOIB/0MmQQXCFkPopDo+HRy6MhhLMAjWFhvz+z6IrSYWKHptuOBzb2ExrIu3ROYj0oTmuTAG0m3m96KRw0XSVSYV+BpL/LQ1vv5aB0w4+xUSdx2lbikeKy6101y5jitZcUQ3KJBsJXeNMeUc3CLFX/YekQiy2KrbyYigcI8Lvskg78B09Knah3wQnexCOYg6NBw5B39Rdd0yUwhFtH4VkdT9x0C9JC/wQDg1mojvfZsMdBgq74idYXgET9eg21nthc/ASC3r2arScgzKe1uQsNysL8AWUCDtQpgeDflcIG00UKU1hqMAYWMb8jJyB6K1HcKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XI0Av8Hx2qqqpt1McWMrwCCOvbfCs/Gqng+YAMWLVjM=;
 b=UjN4rliYGsDnMvN2mHGsYgVCOFj6khYtqeP+EJGsH4iScfLasJq1XCYkahBM6n9CpND9HqqDUBJuF7nSn8BWxeJPJUpHY0W+whIVW5yupDWmpwArjAx2Mt7FlcILuVUadkLbw8HSTtxO7bbMxV8jUNHc2J+BqwMRuLf534Qv3SE3eGwomkalCYqoeHLVm3MJ+v/aWGcOWwfiftxD3rHly2+Ie0aqaAkRWshvzbcXWfHePJshXOVOyY3TtYuKevIgOeJnL3EhJKMqg2Dv3eSSBzjoN8spmhV/hvN+BK3S2mHpKSN2NWkYvesD5RyuUkbV6LNW1XdB4a+DH3RSfMqTMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XI0Av8Hx2qqqpt1McWMrwCCOvbfCs/Gqng+YAMWLVjM=;
 b=Cm2JXUyC2AqVMePQ6KbaQ2efK4903zfWxpKynHLYKqeMCsNFFltoyZdW+7i7sNVux7BOQzQqvygMpBXgwTqKPXVdqCeh8P0ZBFfwbahT60aVw2g1P3Q9e1Lmj/sH/NfpICFKSoV3lz4Ef9ZXsiQbvu9R3fTGETVbqEP2zBDOCsc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB11763.jpnprd01.prod.outlook.com (2603:1096:400:40a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Fri, 10 Feb
 2023 07:14:56 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%7]) with mapi id 15.20.6086.019; Fri, 10 Feb 2023
 07:14:54 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Eric Tremblay <etremblay@distech-controls.com>,
        Wander Lairson Costa <wander@redhat.com>,
        linux-serial <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/3] serial: 8250: Identify Renesas RZ/V2M 16750 UART
Thread-Topic: [PATCH 1/3] serial: 8250: Identify Renesas RZ/V2M 16750 UART
Thread-Index: AQHZPIoo27lI1/ND9EOlwJCIJRVMQa7GpwWAgAAEK7CAAH13AIAAljxw
Date:   Fri, 10 Feb 2023 07:14:54 +0000
Message-ID: <OS0PR01MB5922C55E79014C84C742AE0886DE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230209132630.194947-1-biju.das.jz@bp.renesas.com>
 <20230209132630.194947-2-biju.das.jz@bp.renesas.com>
 <4470e054-ebe6-b3ca-ffd7-1c7c3ae09f1a@linux.intel.com>
 <OS0PR01MB5922AC5FF10FFF5F8590B8AA86D99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y+VrOGR+7LbBMahz@smile.fi.intel.com>
In-Reply-To: <Y+VrOGR+7LbBMahz@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB11763:EE_
x-ms-office365-filtering-correlation-id: 07fb84eb-3da2-4568-a24b-08db0b36824b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /nqiW2Am4k8OOTIC2fOf1/IQQlTH/d/gD4OI/umQHuDe4sOuV+5EyOfCmxMd4fAkRmnEVLKtWKJ4Meq/EplLKBgO9DPmJyrwPeSOuPG7M2cFD3RcdnTf9HcXSkQ8EQdYIsY1Nc72eldOXU9PKPmz06RcatiPxaJPhgU1KLO1F+PN2EtdyKgxhYb0OR1jR1CTgRXISTuPci4E0bJhKNQmkuYkBwDVUmHwZPTHt5X+u+ROz59l1T+M+mLkmXZSJeh6PAqo4MK+bDcrv8F979qzqpQign8WFthL0H2am5BRY9FFo8Tjs6lu1E7f9ettfKMX56xJFemZmXK9nwTWfhre2Z3npXbMeJf5Qb9hC5T/LNHUMwCN92PP2g376tXg4K5Io4ijR1s/8dPgAJk4t33e5ySydaYOQ1CRxfSlT9j++OFAi/s3d3Nz6fE7DgFziOCAXoEIuYF6KGzeVXIDx5aLAOqa7LZsox/opwpPiPsTR3LWIryelGZfZJz84hnGAZlq4WB5Jcf3VN2AencWoDgwtah5oIKgkh9I0KKkPmxZd72bFQjSQVYquSZDB9X6+wEyJxW7UjiCG5xx3pGeMePCMPSipAiFlHAVQ6ZSXKxTbNU4dKi1+txcY0wmVbC6KqDccc+ffCwGxE2z+NBCc5tO9CI/1EaK5Xi2k1Wn3yJfc0XmF7KMYhxIe8B6zw9njFhTBdheuqQPXFA4rPAcTF7hEQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(39860400002)(346002)(366004)(136003)(451199018)(71200400001)(7696005)(478600001)(66574015)(83380400001)(55016003)(86362001)(33656002)(38070700005)(122000001)(38100700002)(6506007)(9686003)(41300700001)(7416002)(54906003)(52536014)(8936002)(316002)(6916009)(8676002)(4326008)(64756008)(186003)(2906002)(5660300002)(26005)(76116006)(66446008)(66556008)(66946007)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?YmJz3/FV1+jXHEo+F13gxBWx8Fnn3exiIBTXk+jKJ1wnNXUIAY2b0t1aQw?=
 =?iso-8859-1?Q?xki/7QLJCKUlTKGAcCGzZuUY/laB/YUTUUwRW22HzxP+q7uTaJ6ZS0t0fF?=
 =?iso-8859-1?Q?7LOBGpuTiv5B9OqWQxes455id1+3I4RjW481gVDYZ8ZsLuESyKTyikkeGO?=
 =?iso-8859-1?Q?DcshL5DdX8njNuaj0+N032BDgovWH/35Qp0ZsQJ5rbxolGjEqN+wyH9p5n?=
 =?iso-8859-1?Q?yjS1WZOOk27njlHt0EwZ/IueJmMyjOiUf9fJ8pX3bBS1GfZ5PUJ9ipa5Uv?=
 =?iso-8859-1?Q?DkhLFPNLsNSm6FxTvLjzN4aVQ59WHDgt5fxKeQ8fRwBcPeUtlHKDxQB0hi?=
 =?iso-8859-1?Q?FNWiIiYGoz8ioHiSCzkpimeZ6+pPGa0sbJbT6og9Pflo+N7H5StBp14nkN?=
 =?iso-8859-1?Q?+6oSdXkr0vLMH0Jgu/H3dV3dSQs4WAnnw+zMHKEjfJ3j67j6x6ectY0Lxv?=
 =?iso-8859-1?Q?EWbYDWrXT/XGE1VhdJoLoTS4bXdYMEmJReDitCRPd44livtfjGmnXvXC6o?=
 =?iso-8859-1?Q?imvzxzmapV+NEP6XBEagTKeFIBuInq+CzK+xeDs6lD8aHvD3A6jlsmtg5G?=
 =?iso-8859-1?Q?B7FIjI/xkUmAsYDkLg93iUgEgy2uZHFjPMddfX10fLK4+QPHs+tFzJuGe8?=
 =?iso-8859-1?Q?dhBJmMRkNh3xS+uft6lsOsIiAt5hWSUQmCNptVdGSyeDjVsLYnJrLrPgB2?=
 =?iso-8859-1?Q?kZ55HHbfxGy9bLT/o3QEpEN3KBAXszZo+TQbacQlIdyVcqHgjqWEY7CCEN?=
 =?iso-8859-1?Q?32sJ0Uy1kcNhrg2vfBjXgI+z9QxpiZKsySFSaNwvOAQ/eAbCmwS60lAdGB?=
 =?iso-8859-1?Q?aUnMeCmwmOXI69rAv7xDbqOgW5hb4rd/OkhJqIlNw3sO+f7wNdVjcRebSe?=
 =?iso-8859-1?Q?o6Ri5RgNqqgUngd7jrGzZH3CNAuNHmqudRFeHi5Q8XZtUf0Uk0Ctf0iPgm?=
 =?iso-8859-1?Q?pyL6CdcNrJlSP3eeI6ZRfngvKmENYuL9n2MCJZ/2oRxo1N33CVVpA60Wrb?=
 =?iso-8859-1?Q?t1xfbTUjjf0xankxfsfseLj/yFRkwVeutHDbCo0j3kapaNra8UFWKnIrcd?=
 =?iso-8859-1?Q?JQG6Zn/qt2JUi+doy/zE74dypznz/UgvB85IDdVVcEqflvQpO3oZcWZnK2?=
 =?iso-8859-1?Q?/TTf8GclRnYGQCbqs8myKiHUaKn6HUnsriu/bGScSg0PHZKZgiLCo3MTZf?=
 =?iso-8859-1?Q?4DoRgkEU2Inau0UNtRFbz/gYw9VCTeJDJWd52YNR9B9liXjzu4lgyAbK/H?=
 =?iso-8859-1?Q?csX5TXgIQSG6zqCpXp42a7SPlKQEMXa+O5GpD7eHluKaOCkKuw8wR8BPyL?=
 =?iso-8859-1?Q?iqwgAb12p4aKOKUCMCdiSC4j1VLlt34/tXEMGSUP+Ez6/AwmDs7yQcpoxV?=
 =?iso-8859-1?Q?L9wv7FXyQ56RcJZMHecnhDZnLGpFtzffvc2a3qsyZHx6T1niSUhiATuN6T?=
 =?iso-8859-1?Q?DdQ1AHXG3jpm5+3jayn6D0L4qhnSBKBdpWfsd4ME6A1LKDpli4S5bCzLVm?=
 =?iso-8859-1?Q?PDCndFdyEKd6JV4bDuycoKZhIBrG19+PnV3pV9+reNzvZWrt9r20i0H+tF?=
 =?iso-8859-1?Q?dYwUWIOB7YoLrk0ANCzX21MnE3uns28Uv6PPPvutI5Oic8l8iwkgrF1ohy?=
 =?iso-8859-1?Q?W076GnQfUkg7/JyotVgWVV8lOE9hmagwytLkH3BFIrI5vvJoun2sNz5g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07fb84eb-3da2-4568-a24b-08db0b36824b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2023 07:14:54.4879
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B4981WzW+CgNRM7pxKocNUrMgHSNKAmAQVib4so6u7b8ckmatfz1q399PnD2IIliWtyGIosCSDDhmsih55rB0iEwMkyZEphSV3NjlNxAkJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11763
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy Shevchenko,

Thanks for the feedback.

> Subject: Re: [PATCH 1/3] serial: 8250: Identify Renesas RZ/V2M 16750 UART
>=20
> On Thu, Feb 09, 2023 at 02:28:55PM +0000, Biju Das wrote:
> > > From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> > > Sent: Thursday, February 9, 2023 2:09 PM On Thu, 9 Feb 2023, Biju
> > > Das wrote:
>=20
> > > > +	[PORT_16750] =3D {
> > > > +		.name		=3D "Renesas RZ/V2M 16750",
> > > > +		.fifo_size	=3D 64,
> > > > +		.tx_loadsz	=3D 64,
> > > > +		.fcr		=3D UART_FCR_ENABLE_FIFO | UART_FCR_R_TRIG_10 |
> > > > +				  UART_FCR7_64BYTE,
> > > > +		.rxtrig_bytes	=3D {1, 16, 32, 56},
> > > > +		.flags		=3D UART_CAP_FIFO | UART_CAP_AFE,
> > > > +	},
> > >
> > > Eh, how can you reuse [PORT_16750] again in the initializer like that=
?
> >
> > Oops. Missed it. Is it ok to introduce PORT_RENESAS_16750_F64 instead
> > as PORT_16750 is used by TI16750?
>=20
> What the difference to the 16750 from TI that prevents you from using it?

Mostly it is identical.

The main difference is detection method, and we don't have UART_IERX_SLEEP =
bit in IER.

On TI, it sets bit 5 of the IIR when 64-byte FIFO mode is enabled when DLAB=
 is set.

Whereas in our case DLAB does n't have any role for Identification,=20

It set bit 5 of the IIR when 64 byte FIFO mode is enabled.
and it clears bit 5 of the IIR when 64 byte FIFO mode is disabled.

Other than that, when I use PORT_16750 type and capabilities in 8250_em dri=
ver and=20
add identification method for Renesas UART in 8250_port driver,

It detected as PORT_16750 UART, but I get below prints during autoconf whic=
h is confusing for the end user

[    0.214926] serial8250-em a4040000.serial: detected caps 00000900 should=
 be 00000d00
[    0.214975] a4040000.serial: ttyS0 at MMIO 0xa4040000 (irq =3D 24, base_=
baud =3D 3000000) is a TI16750


Modification in 8250_em driver

+		    up.port.type =3D PORT_16750;
+               up.port.name            =3D "Renesas RZ/V2M 16750";
+               up.port.fifosize        =3D 64;
+               up.tx_loadsz =3D 64;
+               up.capabilities =3D UART_CAP_FIFO | UART_CAP_AFE;

Identification method in 8250_port.c driver

+       /*
+        * No EFR.  Try to detect a Renesas RZ/V2M 16750, which only sets b=
it 5
+        * of the IIR when 64 byte FIFO mode is enabled.
+        * Try setting/clear bit5 of FCR.
+        */
+       serial_out(up, UART_FCR, UART_FCR_ENABLE_FIFO);
+       status1 =3D serial_in(up, UART_IIR) & (UART_IIR_64BYTE_FIFO | UART_=
IIR_FIFO_ENABLED);
+
+       serial_out(up, UART_FCR, UART_FCR_ENABLE_FIFO | UART_FCR7_64BYTE);
+       status2 =3D serial_in(up, UART_IIR) & (UART_IIR_64BYTE_FIFO | UART_=
IIR_FIFO_ENABLED);
+
+       if (status1 =3D=3D UART_IIR_FIFO_ENABLED_16550A &&
+           status2 =3D=3D (UART_IIR_64BYTE_FIFO | UART_IIR_FIFO_ENABLED_16=
550A)) {
+               up->port.type =3D PORT_16750;
+               up->capabilities |=3D UART_CAP_AFE;
+               return;
+       }
+

Cheers,
Biju


