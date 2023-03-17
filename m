Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 262696BEB88
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Mar 2023 15:40:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbjCQOkw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Mar 2023 10:40:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbjCQOkt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Mar 2023 10:40:49 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2136.outbound.protection.outlook.com [40.107.114.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81BEE10DE56;
        Fri, 17 Mar 2023 07:40:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ef7iMKxVZYX1XNH/Y0W2UVHwreXR419dpNLzgn8qiMGykUNSMK06x1xMUqmxp5WO1FP0rxFPJDrlWsEtyDHuGVDOuoAmi8p5Te5NYOAzK2GIFwXu+azJ98xp2nyFbUJE6CUQVgkvtOd+hPKCRWBvLphz8ZUTysSySACrn3GbMKoWM90GZ637xUWh5Ra0m+5zAAVaIZdvZ3DHzUoJe+1s5VWMvSBvXn+avfcmVo2Fid+OHq7qpdaZWtWz5RE7I7IQmxkGh4FQpVadKnqY0crnAe/BYFByij4oOcNtdro8grj/ag2mTzDDdTAlBKBlzcMT9bdiXPdB5qENsQxSahAUAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExjI2+mUxG/9FNVV8KUkvA4f6DIcQxyiOoInUeeQjx0=;
 b=WdMdwf2MIRCOPSnhHRdfBsS+NUygWzL7+3eBPUFy4ShPjaNzzd+/ks/l2iFzWAOD+KQAGXjhPx4XuOGvuIuGC2fgE1vAx9d59FskNaeXYlg48m8rrkfyTbR5cVvbM3AGRaU11Idc9otQUNyTPOktERqdZYB6b2G5jvCM4iq6AT3a52uF8OCjuU1IZxV+69mH2PEswbOxJqtt9+fgSlb5ziVHUYgHVfC84gFSGtaBCWKWkLlqLRT/PwiRZO9JHKVWStS05FxYYrVKNnn9UpxIECL873Fa4dkHZxbKSEo3xH0RbTQeg/yTXBUZ8nfHmkIDT343IfY+YV3iH9gTVU3G2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExjI2+mUxG/9FNVV8KUkvA4f6DIcQxyiOoInUeeQjx0=;
 b=vjpvXZF85lRXAumW4lMaRMq+AV9qV1O5TBSreNuJN+sfPKghdaG2c5wEN1+PMKSUvIocPwB8Cv1Q5KwAH3WA1B7QoY3stOjL1MCKQcOeBC9+i63GSW/a121Z0U8rQuNS1TeuQWkSsUVBjz2zrrSbmAHzh3RY3rDeKQIXmjvjWFk=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB8821.jpnprd01.prod.outlook.com (2603:1096:400:16c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 14:40:38 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207%7]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 14:40:38 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Stephen Boyd <swboyd@chromium.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
Subject: RE: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
Thread-Topic: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
Thread-Index: AQHZWCCS4vXtQ/fzW0yUXUaCYffr6a79lBkAgAAA5oCAABuIgIAA62sggAACXICAAABMkIAAEAYAgAABSMCAAAg9AIAAQyAQgAAOpwCAAAFtMA==
Date:   Fri, 17 Mar 2023 14:40:38 +0000
Message-ID: <OS0PR01MB5922D7E9C3602017BCA7128686BD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230316160118.133182-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVX=sM-1y+-3PQDsjf8K3nLoS4WfSYfv6UAP=92T_oHaQ@mail.gmail.com>
 <OS0PR01MB5922EA7DC64F0D2C36B490A986BC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXgwkJ2O7y98HW6n8SOgbuEx1uFrt1Jc-X2CzpC3y1P0Q@mail.gmail.com>
 <TYCPR01MB593334BB3847CCC45A1B6C7286BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <CAMuHMdUN=0aJ-7huv0XrhG3LMu8q_SEuqHU48ytTgGAYEjng5A@mail.gmail.com>
 <TYCPR01MB593390150CAC755AE540D7D586BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <CAMuHMdVmz_JNmC7Fk03zpaZY+MiBAgvFUc1Tnr+w=wHjbgeSug@mail.gmail.com>
 <OS0PR01MB59228F2CA5A579AEE793A67486BD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdW5jpnFBsHPbTE9QEbEYUNW9S0Qz93gg3QusLe0aSSbGg@mail.gmail.com>
 <OS0PR01MB59220E5FA2CDC27108DB926C86BD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdWcizpvQQ2A4bMLDfCHFmy_0MHL2ao62Ujiv4J28deGSA@mail.gmail.com>
In-Reply-To: <CAMuHMdWcizpvQQ2A4bMLDfCHFmy_0MHL2ao62Ujiv4J28deGSA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB8821:EE_
x-ms-office365-filtering-correlation-id: 7364e0db-ae31-4874-2710-08db26f59384
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rumuQ7fNr4G1feoZom3ntvc+WFMB6ORQ9+AZMH1pe+tPzAAvstmXG177vZV1ojUSZbD51scKSm3Bd1UFJUfQOkKP0eCf/QfbIWsBw6r7j3EsOtVS+WpeZhK+4yBQsgDPbc6jijUyyNuQRpvMbht/hEfZttg+jG4HXnqkdGXyCtz6QH6vTNdKlSchJxvCAW80jE4Ldeb709JtMw0MsqcROZ+R1oKbqoOpy5OmjSW68mg271etBYktLtaiJiuTXdEVl0aXOjcgdBdy2S3Yxs8LuABMPlfLoVJb3X2oLb9ldaf8RowHuNZmON9F9+cYChXR64pME+mNsQtzrRLuAg+cfXpMLYIqrd4+JXLymAuL5obJztkaf02bbzKhYHLvznOyZUWjy/Tbo0V9cexxz83mwj6g5W3bCm6ZKPi7UC0CAfH8pocSx1IGYrd9CwlkmYLTj65I1lAUYqlu7N1/s96pLb8BRQ2ZIGYKYlS4nl26ZyqG2PiurIeUqhnvyGBIObGc+G09rB1jWvr6PZZ4SFZxmc/fZ9aNd7N195dRoy6vGGG9+L/mcVcvYKYN2ClGw15rCcpMYdMHyAxHcXSS6I4VK7kbK2gqF8apMbL/v8Lm6cS7uP8iNeJNmahHoF28nMH2UD1IKj1ELj/CKAgLAIiVvqkRbsITEi9fdHerZ8QC/IejDquGICLRPALh9lYFtV9FZ03kkE8ucyHHCZ8jkm+57Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(451199018)(41300700001)(5660300002)(66556008)(66476007)(66446008)(64756008)(8676002)(4326008)(6916009)(2906002)(86362001)(38070700005)(33656002)(38100700002)(122000001)(71200400001)(7696005)(478600001)(54906003)(76116006)(316002)(52536014)(8936002)(55016003)(83380400001)(66946007)(6506007)(186003)(9686003)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDBTc2UwWHJGekd6Ukg4enRocFFLT25hR0czWXRTS3RVU2FlaU1mVWYyUERn?=
 =?utf-8?B?ZERoOURveTloWVJYdFR4SkxpNmIzbml2eVZNSmhiZ0hzcjE0TEJpMEZ2ZGJK?=
 =?utf-8?B?aytKMmExL3UyYi9LYWQvenVwZjRDVkZ4eDVKaFJJRDN2Q25vS2xMYjFJZGlD?=
 =?utf-8?B?a3kwN0wwQUtmMURCNzZXZG1yeDJNVkNsTnZpWGlpRTFGdGdqcmpQY1NDYnhU?=
 =?utf-8?B?M2c1TzAva3RnazZ1dHhtQk45YzNWVnZFUE9Wa3pueVFJNUJUdE1zRFJGbTFu?=
 =?utf-8?B?WmZxL3BuY25vN09oSXpjOERmM2c4dUdoUUZsZkVKL2VhdWlaclhtNGNYeFR6?=
 =?utf-8?B?RHY2YU1Zd0Q1UVMyZnN5dlprYXlZbG9XYVNtYk5zOXh6MnFta2V5WHRQbjNy?=
 =?utf-8?B?L1E0L2VuUjNvZzk1aXowRlNxRjVGMWpyNVEyQ3d5cHQvN2JHVllYZ3Brci9T?=
 =?utf-8?B?QnVyL3ZhS1libjh3ZFM5ckk4RStNMlhQY1BLa1FUcnR4aXZKS2NvM1lJQStZ?=
 =?utf-8?B?VUkwcnF3NHZaVFk0M1M4THRwTDZySVYwRkxVaUJxZ2tZa3NEbXFXVG5WeHFI?=
 =?utf-8?B?N2VGcXVKY3FHRWEvbGQvTUxTd0ZsVHFRc1lYRlphSEhMSlJEWE5pM0hvMjJ1?=
 =?utf-8?B?bDcrSUdhRFN6Rmg1UXhBcDFJbm1jTlVNa2NLRjZHL1lKZlYxWm5JbkVuS1JO?=
 =?utf-8?B?R3RYenBpZjkwVzlJQXpqcmFTTWdSUFpMOUhZTzJOUklyUVE5TG5sazhKbGRI?=
 =?utf-8?B?bzNvTHpxS0EwOGxMNUtKeFZqQklQb0YzeUlBcHFZWkxTdy9vcSs1VkxqNmRy?=
 =?utf-8?B?eUFldkgwdWRhWFFadmF1YkN5ZElmYWNlUm9nYzVqcWJ3a3BqMGI0cXZMZ0hY?=
 =?utf-8?B?R1NuVjhRSWFpbktIVFBnNERlSkNTYXRzK245a2RFVVAwQ1hMSUVJL0sydUxn?=
 =?utf-8?B?U3lyUXIvL3hRU2N1Q1MrU3ZhWGNma0Q3M2l4T3hZcmJwekZJNVZGeUlKZUNu?=
 =?utf-8?B?alhLbC80ZXFwUnNKU0lOdzRTQjBSakRBc0kwTVVEZVAzY3hpdndaSlJvWGFY?=
 =?utf-8?B?bG1SMkQzK2VwSmJWRW9tdDZhZjVzTU1DSVJYN283VmhzTU82ZkN4YlVncmhv?=
 =?utf-8?B?bW00Q1FZcGdpc0JFblBhQ2QvS3QzK1N5MkJlZUoxMWd3QTE1d0ZTVkZnODd6?=
 =?utf-8?B?eU0yUTRnSmc0S2Fnd08zS1dlM3hXUXI3VHpwazQycUVOc1ppV3hrSTdwVTFM?=
 =?utf-8?B?L3Y4WHBEcm54NGl0RGRYWFppalVPQjVFWnluamtPaWdPaFNwNUlvWVJncExr?=
 =?utf-8?B?bGhXYzU4WkZnY1NNY1MydFUvRCtaenNMcUhnUjdINjQ3aVZtNVF5S1NFZUdx?=
 =?utf-8?B?bm1XeVFSWFpFSm9DbGhzY242TWpLQitFSlo3dG5kbnMzSXMzSTFSQVdtc1RE?=
 =?utf-8?B?M0tYS0lTOGRyMkp5U3RnUW40YTAydnFjS3FDbGx6RVVGMzBqcm5kV215ZzdC?=
 =?utf-8?B?TTFpVk5OUlU3bGczQUlNbmtoNFgwd1EvcytSdDFzdEpKWjZodW51VTVvVk9F?=
 =?utf-8?B?MHdZdStJcEJ2QWVPU09jZituQkVudmpFOWRRMmdZZkRXeVZrOWtpQlpkYXcy?=
 =?utf-8?B?dkszLzFqMERpeGZOOFBMdWNKY1dRa3FWeU84S2lHb0xhUS9CV2l1TDJScFE0?=
 =?utf-8?B?ZkpSNVEway9Fck00eTEzUEdRZnpCOFFWb2REbWpadFZpZEFDV2N2VzJRV2FG?=
 =?utf-8?B?TVFvZWV5MmhKTElhaVFLOWN0Rk1ib2pxejFTTWFtY3RKeVVYdWx1Mkw0NURa?=
 =?utf-8?B?S3pJV3gwM3kxTGExaGdqcVJMYmFkTVhOYUlocVlhQjJsTEtaNXREc2p6azJG?=
 =?utf-8?B?c3VsdWU1Vm9PaDFZSWVCdE9ET3ZpbXVTY3Jqc20xaUtjeXRJTHZYN05EcUhT?=
 =?utf-8?B?QlRRcDhDUmhpN3pNcFRPNXBRL0N3eGJCRVdSQkNkOHVVelFrbVJsZG04eGU0?=
 =?utf-8?B?ZHpvVTJ2WkJmeUNwSEVmd2p3TURYSHMzOUhhdnp4VitWangrS2x5RXN1aXVl?=
 =?utf-8?B?ckZMOGM0eU9IL25NeTU5RTNXd0tKRzU5ZkZmcU1MTHpOcGNLeDRuU2tYeDFx?=
 =?utf-8?Q?C//A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7364e0db-ae31-4874-2710-08db26f59384
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2023 14:40:38.6343
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Jg8zNe1ftewvdHCT1kPPKo1gjKdcWgRLYl2y8hLqRg04Vthxa+0xlqJA82EspTWY4XBnXAvbUvC/5DClf4n4++WN5r8D0klKIbjZ1ugkxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8821
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gdHR5OiBzZXJpYWw6IHNoLXNjaTog
Rml4IHRyYW5zbWl0IGVuZCBpbnRlcnJ1cHQgaGFuZGxlcg0KPiANCj4gSGkgQmlqdSwNCj4gDQo+
IE9uIEZyaSwgTWFyIDE3LCAyMDIzIGF0IDI6NDfigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSF0gdHR5OiBz
ZXJpYWw6IHNoLXNjaTogRml4IHRyYW5zbWl0IGVuZCBpbnRlcnJ1cHQNCj4gPiA+IGhhbmRsZXIg
T24gRnJpLCBNYXIgMTcsIDIwMjMgYXQgMTA6MTXigK9BTSBCaWp1IERhcw0KPiA+ID4gPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gd3JvdGU6DQo+ID4gPiA+ID4gU3ViamVjdDog
UmU6IFtQQVRDSF0gdHR5OiBzZXJpYWw6IHNoLXNjaTogRml4IHRyYW5zbWl0IGVuZA0KPiA+ID4g
PiA+IGludGVycnVwdCBoYW5kbGVyIE9uIEZyaSwgTWFyIDE3LCAyMDIzIGF0IDk6MDjigK9BTSBC
aWp1IERhcw0KPiA+ID4gPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+
ID4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSF0gdHR5OiBzZXJpYWw6IHNoLXNjaTogRml4IHRy
YW5zbWl0IGVuZA0KPiA+ID4gPiA+ID4gPiBpbnRlcnJ1cHQgaGFuZGxlciBPbiBGcmksIE1hciAx
NywgMjAyMyBhdCA4OjU54oCvQU0gQmlqdSBEYXMNCj4gPiA+ID4gPiA8YmlqdS5kYXMuanpAYnAu
cmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gPiA+ID4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRD
SF0gdHR5OiBzZXJpYWw6IHNoLXNjaTogRml4IHRyYW5zbWl0DQo+ID4gPiA+ID4gPiA+ID4gPiBl
bmQgaW50ZXJydXB0IGhhbmRsZXIgT24gVGh1LCBNYXIgMTYsIDIwMjMgYXQgNTozNOKAr1BNDQo+
ID4gPiA+ID4gPiA+ID4gPiBCaWp1IERhcw0KPiA+ID4gPiA+ID4gPiA8YmlqdS5kYXMuanpAYnAu
cmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIHR0eTogc2VyaWFsOiBzaC1zY2k6IEZpeA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IHRy
YW5zbWl0IGVuZCBpbnRlcnJ1cHQgaGFuZGxlcg0KPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4g
PiA+ID4gPiA+ID4gPiBPbiBUaHUsIE1hciAxNiwgMjAyMyBhdCA1OjAx4oCvUE0gQmlqdSBEYXMN
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4g
PiA+ID4gPiA+ID4gPiB3cm90ZToNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IFRoZSBSWiBTQ0kv
IFJaL0ExIFNDSUYgaGFzIG9ubHkgNCBpbnRlcnJ1cHRzLiBUaGUNCj4gPiA+ID4gPiA+ID4gPiA+
ID4gPiA+IGZvdXJ0aCBpbnRlcnJ1cHQgaXMgdHJhbnNtaXQgZW5kIGludGVycnVwdCwgc28NCj4g
PiA+ID4gPiA+ID4gPiA+ID4gPiA+IHNodWZmbGUgdGhlIGludGVycnVwdHMgdG8gZml4IHRoZSB0
cmFuc21pdCBlbmQNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IGludGVycnVwdCBoYW5kbGVyIGZv
ciB0aGVzZQ0KPiA+ID4gPiA+IElQcy4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+
ID4gPiA+ID4gPiA+ID4gPiBGaXhlczogMzkyZmI4ZGY1MjhiICgic2VyaWFsOiBzaC1zY2k6IFVz
ZQ0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gcGxhdGZvcm1fZ2V0X2lycV9vcHRpb25hbCgpIGZv
ciBvcHRpb25hbA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gaW50ZXJydXB0cyIpDQo+ID4gPiA+
ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBJIGRvbid0IHRoaW5rIHRoYXQn
cyB0aGUgcmlnaHQgYmFkIGNvbW1pdC4NCj4gPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+
ID4gPiA+ID4gT0suIEkgd2lsbCB1c2UgYmVsb3cgY29tbWl0IGFzIGZpeGVzIG9uZSwgdGhhdCBp
cyB0aGUNCj4gPiA+ID4gPiA+ID4gPiA+ID4gY29tbWl0IHdoaWNoIGFkZGVkIFJaL0ExIFNDSUYg
d2l0aCA0IGludGVycnVwdHMuDQo+ID4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4g
PiA+IGNvbW1pdCA4YjBiYmQ5NTYyMjhhZTg3ICgic2VyaWFsOiBzaC1zY2k6IEFkZCBzdXBwb3J0
DQo+ID4gPiA+ID4gPiA+ID4gPiA+IGZvcg0KPiA+ID4gPiA+ID4gPiA+ID4gPiBSN1M5MjEwIikN
Cj4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiBUaGF0IG9uZSBhZGRlZCBzdXBw
b3J0IGZvciBSWi9BMiwgYW5kIGlzIGFsc28gbm90IHRoZQ0KPiA+ID4gPiA+ID4gPiA+ID4gYmFk
DQo+ID4gPiBjb21taXQ/DQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiBPSyB3aWxs
IHVzZSBiZWxvdyBvbmUsDQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiBGaXhlczog
NGM4NGMxYjNhY2NhICgiQVJNOiBzaG1vYmlsZTogcjdzNzIxMDA6IGFkZCBzY2lmDQo+ID4gPiA+
ID4gPiA+ID4gbm9kZXMgdG8NCj4gPiA+ID4gPiA+ID4gPiBkdHNpIikNCj4gPiA+ID4gPiA+ID4N
Cj4gPiA+ID4gPiA+ID4gVGhpcyByZWFsbHkgc3RhcnRzIHRvIGxvb2sgbGlrZSBhIGd1ZXNzaW5n
IGdhbWUuLi4gQmVlcCA7LSkNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBBbHJlYWR5IHRoZXJl
IGlzIGEgZ2VuZXJpYyBjb21wYXRpYmxlIGluIGRyaXZlciwgd2hlcmUgd2UNCj4gPiA+ID4gPiA+
IHN0YXJ0ZWQgaW50cm9kdWNpbmcgUlovQTEgU29DIFdpdGggNCBpbnRlcnJ1cHRzLiBTbyBhZGRp
dGlvbg0KPiA+ID4gPiA+ID4gb2YgdGhpcyBTb0MgaGFzIHRoaXMNCj4gPiA+ID4gPiBpc3N1ZS4g
QW0gSSBtaXNzaW5nIGFueXRoaW5nIGhlcmU/DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBUaGUgcmFi
Yml0IGhvbGUgc2VlbXMgdG8gYmUgZGVlcGVyIHRoYW4gSSB0aG91Z2h0Li4uDQo+ID4gPiA+ID4N
Cj4gPiA+ID4gPiBMb29raW5nIGF0IHRoZSBjb2RlLCB0aGUgZHJpdmVyIGFsd2F5cyBhc3N1bWVk
IHRoZSBmb3VydGgNCj4gPiA+ID4gPiBpbnRlcnJ1cHQgaXMgQlJJLCB3aGljaCBtYXRjaGVzIHRo
ZSBSWi9BMSBkYXRhc2hlZXQgZm9yIFNDSUYuDQo+ID4gPiA+ID4gU28gdGhlIDQgSVJRIGNhc2Ug
aXMgcmVhbGx5IGEgc3Vic2V0IG9mIHRoZSA2IElSUSBjYXNlLCBhbmQNCj4gPiA+ID4gPiBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL3JlbmVzYXMsc2NpZi55YW1sDQo+
ID4gPiA+ID4gaXMgd3JvbmcuDQo+ID4gPiA+DQo+ID4gPiA+IE9LLg0KPiA+ID4gPg0KPiA+ID4g
PiA+DQo+ID4gPiA+ID4gSG93ZXZlciwgU0NJKGcpIGlzIHRoZSBvZGQgb25lIChhbHNvIG9uIFNI
KTogaXQgaGFzIFRFSSBhcyB0aGUNCj4gPiA+ID4gPiBmb3VydGggSVJRLCB3aGljaCBJIHByb2Jh
Ymx5IG1pc3NlZCB3aGVuIGRvaW5nIHRoZSBqc29uLXNjaGVtYQ0KPiA+ID4gPiA+IGNvbnZlcnNp
b24gaW4gY29tbWl0IDM4NGQwMGZhZThlNTFmOGYgKCJkdC1iaW5kaW5nczogc2VyaWFsOiBzaC1z
Y2k6DQo+ID4gPiA+ID4gQ29udmVydCB0byBqc29uLXNjaGVtYSIpLCBsZWFkaW5nIHRvIHRoZSBi
dWcgaW4gc2NpZi55YW1sLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gTm90ZSB0aGF0IHRoZSBkcml2
ZXIgbmV2ZXIgbG9va3MgYXQgdGhlIGludGVycnVwdCBuYW1lcywgYnV0DQo+ID4gPiA+ID4gdXNl
cyBpbmRpY2VzIGV4Y2x1c2l2ZWx5Lg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gU28gSSBndWVzcyBT
Q0kgaGFzIGJlZW4gYnJva2VuIG9uIFNIIHNpbmNlIGZvcmV2ZXIsIHRvbz8NCj4gPiA+ID4NCj4g
PiA+ID4gSSB0aGluayBzbywgYnkgbG9va2luZyBhdCB0aGUgY2hhbmdlcyBkb25lIGluIHR4IHRv
IG1ha2UgaXQgd29yaw0KPiA+ID4gPiBvbg0KPiA+ID4gUlovRzJVTC4NCj4gPiA+ID4gT24gUlov
RzJVTCBib3RoIHJ4IGFuZCB0eCBpcyBicm9rZW4uDQo+ID4gPiA+DQo+ID4gPiA+IE5vdCBzdXJl
IFNDSSBpcyB0ZXN0ZWQgZXZlciBvbiBTSCBwbGF0Zm9ybT8/DQo+ID4gPiA+DQo+ID4gPiA+IENh
biBhbnkgU0ggcGxhdGZvcm0gcGVyc29uIGNvbmZpcm0gdGhpcz8NCj4gPiA+DQo+ID4gPiBTQ0kg
aXMgb25seSBzdXBwb3J0ZWQgb24NCj4gPiA+ICAgLSBzaDc3MHgsDQo+ID4gPiAgIC0gc2g3NzUw
IChleGNsdWRpbmcgcnRzNzc1MXIyZCkNCj4gPiA+ICAgICBJIGtub3cgaXQncyBub3QgZXhwb3Nl
ZCBvbiBteSBsYW5kaXNrLA0KPiA+ID4gICAtIHNoNzc2MCwgZm9yIHRoZSBTSU0tcG9ydCwgd2hp
Y2ggSSBkb3VidCBhbnlvbmUgdXNlcy4NCj4gPiA+DQo+ID4gPiBGVFIsIEkgdHJpZWQgdGhlICJv
YnZpb3VzIiB0aGluZyAocmVtb3ZlIHRoZSBydHM3NzUxcjJkLWNoZWNrcyBpbg0KPiA+ID4gYXJj
aC9zaC9rZXJuZWwvY3B1L3NoNC9zZXR1cC1zaDc3NTAuYywgYW5kIHJlcGxhY2Ugc2NpX2JyX2lu
dGVycnVwdA0KPiA+ID4gYXMgdGhlIGludGVycnVwdCBoYW5kbGVyIGJ5IHNjaV90eF9pbnRlcnJ1
cHQgaW4gc2gtc2NpLmMpLCBidXQgdGhhdA0KPiA+ID4gZGlkbid0IG1ha2UNCj4gPiA+IHR0eVND
MCB3b3JrIG9uIHFlbXUvcnRzNzc1MXIyZC4NCj4gPg0KPiA+IEkgYW0gbm90IHNlZWluZyBhbnkg
U0ggcGxhdGZvcm0gU29DcyBpblsxXSBhbmQgUlovQTIgZG9lcyBub3QgaGF2ZSBhbnkNCj4gPiBT
Q0kgbm9kZXMgZGVmaW5lZCBpbiBkdHMsDQo+IA0KPiBNb3N0IFNIIHBsYXRmb3JtcyBoYXZlIG5v
dCBiZWVuIGNvbnZlcnRlZCB0byBEVCB5ZXQ6DQo+IA0KPiAkIGdpdCBncmVwIC13IFBPUlRfU0NJ
IC0tIGFyY2gvc2gNCj4gYXJjaC9zaC9rZXJuZWwvY3B1L3NoMy9zZXR1cC1zaDc3MHguYzogIC50
eXBlICAgICAgICAgICA9IFBPUlRfU0NJLA0KPiBhcmNoL3NoL2tlcm5lbC9jcHUvc2g0L3NldHVw
LXNoNzc1MC5jOiAgLnR5cGUgICAgICAgICAgID0gUE9SVF9TQ0ksDQo+IGFyY2gvc2gva2VybmVs
L2NwdS9zaDQvc2V0dXAtc2g3NzYwLmM6ICAudHlwZSAgICAgICAgICAgPSBQT1JUX1NDSSwNCj4g
DQo+IEJ1dCBJIGp1c3QgcmVhbGl6ZWQgdGhlIGFib3ZlIGFyZSBub3QgYWZmZWN0ZWQsIGFzIHRo
ZXkgZGVmaW5lIGVpdGhlcg0KPiAxIG9yIDMgaW50ZXJydXB0cyBmb3IgdGhlIFNDSSBwb3J0IGlu
c3RlYWQgb2YuDQoNCk9LLg0KDQo+IA0KPiA+IFNvIFNoYWxsIEkgdXNlIHRoZSBiZWxvdyBmaXhl
cyB0YWcgaW5zdGVhZCwgYXMgaXQgaXMgZG9jdW1lbnRlZCBpbiBkdA0KPiA+IGJpbmRpbmdzIGFu
ZCBpcyB0aGUgZmlyc3QgU29DIHdpdGggYnJva2VuIGlycSBoYW5kbGVyPz8NCj4gPg0KPiA+IEZp
eGVzOiBmOWEyYWRjYzllOTAgKCJhcm02NDogZHRzOiByZW5lc2FzOiByOWEwN2cwNDQ6IEFkZCBT
Q0lbMC0xXQ0KPiA+IG5vZGVzIikNCj4gDQo+IFRoYXQncyBhIERUUyBjaGFuZ2UsIHdoaWxlIHRo
ZSBidWcgaXMgaW4gdGhlIGRyaXZlcj8NCj4gDQo+IFRoZSBidWcgc2VlbXMgdG8gYmUgcHJlc2Vu
dCBpbiBhbGwgdmVyc2lvbnMgc2luY2UgbW9kZXJuIGdpdCBvZiB0aGUgc2gtc2NpDQo+IHNlcmlh
bCBkcml2ZXIuDQo+IE1vcmUgYXJjaGFlb2xvZ3kgc2hvd3MgZWFybHkgdmVyc2lvbnMgdXNlZCBo
YXJkY29kZWQgbGlzdHMgb2YgMyBpbnRlcnJ1cHRzDQo+IGZvciBTQ0ksIGF2b2lkaW5nIHRoZSBp
c3N1ZS4gVGhlIGV2ZW4gb2xkZXIgc2gtc2NpIGNoYXJhY3RlciBkZXZpY2UgZHJpdmVyDQo+IHJl
Z2lzdGVyZWQgb25seSAzIGludGVycnVwdCBoYW5kbGVycyB3aGVuIGJ1aWx0IHdpdGggU0NJIHN1
cHBvcnQgb25seS4NCj4gDQo+IFNvIHRoZSBpc3N1ZSBvbmx5IHN0YXJ0ZWQgdG8gYXBwZWFyIChp
ZiBhbnlvbmUgbm90aWNlZCBhdCBhbGwpIHdpdGggdGhlDQo+IChyZW1vdmVkKSBEVC1iYXNlZCBI
OC8zMDAgYXJjaGl0ZWN0dXJlLCB3aGljaCBkZXNjcmliZWQgNCBpbnRlcnJ1cHRzIGluIERULA0K
PiB3aGljaCB0aGUgc2gtc2NpIGRyaXZlciBoYW5kbGVzIGluY29ycmVjdGx5Lg0KPiANCj4gU28g
aWYgeW91IGluc2lzdCBvbiBhIEZpeGVzIGxpbmU6DQo+IEZpeGVzOiBlMWQwYmU2MTYxODY5MDZk
ICgic2gtc2NpOiBBZGQgaDgzMDAgU0NJIikNCg0KVGhhbmtzLCBJIHdpbGwgdXNlIHRoaXMuDQoN
Cj4gDQo+ID4gV2l0aCBiZWxvdyBjaGVjayBpbiBkcml2ZXIuDQo+ID4NCj4gPiArICAgICAgIC8q
DQo+ID4gKyAgICAgICAgKiBUaGUgZm91cnRoIGludGVycnVwdCBvbiBTQ0kgcG9ydCBpcyB0cmFu
c21pdCBlbmQgaW50ZXJydXB0LCBzbw0KPiA+ICsgICAgICAgICogc2h1ZmZsZSB0aGUgaW50ZXJy
dXB0cy4NCj4gPiArICAgICAgICAqLw0KPiA+ICsgICAgICAgaWYgKHAtPnR5cGUgPT0gUE9SVF9T
Q0kpDQo+ID4gKyAgICAgICAgICAgICAgIHN3YXAoc2NpX3BvcnQtPmlycXNbU0NJeF9CUklfSVJR
XSwNCj4gPiArIHNjaV9wb3J0LT5pcnFzW1NDSXhfVEVJX0lSUV0pOw0KPiANCj4gVGhhbmtzLCBM
R1RNLg0KDQpPSywgV2lsbCBzZW5kIG5leHQgdmVyc2lvbiB3aXRoIHRoZXNlIGNoYW5nZXMuDQoN
CkNoZWVycywNCkJpanUNCg==
