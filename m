Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5D30696206
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Feb 2023 12:10:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231707AbjBNLKV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Feb 2023 06:10:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232903AbjBNLJr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Feb 2023 06:09:47 -0500
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2134.outbound.protection.outlook.com [40.107.215.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A1C928D31;
        Tue, 14 Feb 2023 03:08:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMe6GNqKAopFXDK5gH3qXbmvEyVxCJDgH0+TTCkfhfGiP3luEjh2TlJ96nYNAYE7IlyJP31OzFIYbfTYfWph04B5kdkpUFjnka7K8kSg9Mj56Sjthi1qZ6WBDUtti5vQ4jNkO0n8psIm3RQwH4lOEWxAOT4mB0+M+5itp9DuoqBAxhsqOtbzMZNwh/cD1vE5TUetB9Vbbd2NsJrbtEsWaXSp9t+dXeQ4pxE2xbc7/HSYA0+GYEg0D8FxFsYrm6Un575qHKNsyL1kHkYGQ1PWOJPUNvgS9/6mPbDC77mZErM8gfLFV2JnpsmsRYCfxrYBuTIWQHkPJsKLHpW5ncv/jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPWB7ztMjhc9gG6E3GAWYaWadp2g0tTUN1XGIPSjUaY=;
 b=LLxsTmqSKta4RfMZaY/kSOe5t3FxH4UgTBV0QJKssXnov+3y8bNFIZ6RX0k2Cws7kuyE9ytlSY5zO+Gvr9OQYqgtg9hQ94ymXoKNzxsR2lPPyBhOhvsJF3YWUjuXw/AA3FWH9zBmGmCrR+YoHC946vSjEMNVnuFld8hJM6+aqieLhlj19ABj/rz0G9afELhtDimHBnXRZdMzMKI4TKIyXh8GVm6KVa4/j1oLKxGudmsSfLVXV32EQ+UyCoGO/FUG5eBAQj3bQ3L7cRvUhIC/8GQE/1b7cYJ0zKvBqf9jp5qdEDBKlm6eQTWctRo23LP5Hp5B4MLWGHwriDW43JlQ4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPWB7ztMjhc9gG6E3GAWYaWadp2g0tTUN1XGIPSjUaY=;
 b=IQQfEJaoGy7qzfDygNNiR/sjhHpLua7Yr2zHuEko1bF0DwqM86ToYAEn7kuYwO9sNnwj00YrSMm2Kd9BhEtg5Y/M+e03HwlDCBw+sVQ5BJssiBf0Jnmljafp8Pa6u580O7gXIAtorJIho2fBsUhvpPoHFf6eJ3ubV/LkFN6BMJ4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB11716.jpnprd01.prod.outlook.com (2603:1096:400:37c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Tue, 14 Feb
 2023 11:07:59 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%7]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 11:07:59 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v3 1/3] serial: 8250_em: Use dev_err_probe()
Thread-Topic: [PATCH v3 1/3] serial: 8250_em: Use dev_err_probe()
Thread-Index: AQHZPY8h1ZUKl9Ywh02HhZtwCaSfrK7MbESAgAHhTxA=
Date:   Tue, 14 Feb 2023 11:07:59 +0000
Message-ID: <OS0PR01MB592216B6003901EC1179BFF386A29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230210203439.174913-1-biju.das.jz@bp.renesas.com>
 <20230210203439.174913-2-biju.das.jz@bp.renesas.com>
 <81328241-670f-8a7a-256c-03919f1a3f67@kernel.org>
In-Reply-To: <81328241-670f-8a7a-256c-03919f1a3f67@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB11716:EE_
x-ms-office365-filtering-correlation-id: 2112ea68-97e7-4b70-79c4-08db0e7bbbc1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 12L9mBjjSx7mdVMhGeoz987EIu46MCEWRjcowYXQcUIWuQn4U+emlJDRCqsZSbC/v+jbPYiq0IfBsm0dhiTntXRfG/bLNumMBD2J6AeVN1GQe6q/K77/WR7k8Zob3hOE+9jyj9DvOt1pYuuXjN8b9cK491PbxihVFzFiyVi0nh52HaHRyv6+os08ElzegxOYdg01bM5R6XModiiRQrVDrBmji+fDgMFfvaXShzlv3lVI4Qkjm1U3BBjC3PyNzu1p3YqmGFikbvwFl3EfawltUXEl87I1nNSY3PggFZrOiRuw+Cz2ADDsqjRlWPdvVnJIMiLxKYwIMJwFqWY5Onhl0ZxXamckfYoNbR63QUVRwqtrOHNELhCUO8EAViqiT6Z12BuUjtGdqpW3B9kUe65P97qstxtvvm2KYbX+jniNgbXVl13ZHBRcQVgYfFg1gwdvPHV5m407b3FvPZdajM0zQHbo+AqZ1JyVYxgGIwindzXqtk4QFSMEcIXOboSdBnmm4Gg4oZ7dE3+B7ySG1tpxpwCI1i5mPYIVvsp0YejDyW792Ydt7raYu3fCkjCB8vr0o3pw2nGTr7dzUhrote/jvWrciI4QrV3c3jvkwIW2gvClOcaS4kBtwEThB0f85iJsN4ix0rOeF0aGwCYXg35jpnG9ukh5K7j3lh/1/SLtoGBjIhrBvwXbgeDb5edpfygu8CA+lxmu+OybfZf3gTIjmQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(366004)(39860400002)(376002)(396003)(451199018)(478600001)(71200400001)(7696005)(186003)(26005)(6506007)(86362001)(9686003)(38100700002)(83380400001)(55016003)(33656002)(122000001)(4326008)(316002)(38070700005)(110136005)(66446008)(76116006)(5660300002)(4744005)(41300700001)(66556008)(54906003)(8936002)(66946007)(8676002)(64756008)(66476007)(2906002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXVPOGdFT0F4VHZoNCt2R2lDSGZrVTh3YVZrWHlVN0NRRCtLZU12Tkd4N09O?=
 =?utf-8?B?ZnZIVXpJZ09vK3JJTnU3TUErT245Ny9SZTQ4TFVodGVTblNTQ3NiUHEwYmRT?=
 =?utf-8?B?MGNVZnBtNlowZU1rV0NkQjkzcEpIeGY4NGNjd0NwMTJRZTNkWVpqSVlRL3Ir?=
 =?utf-8?B?b1NqOEwwNkVyZmxTZmk4OGcwajliUDZRUnpWQ0krZThmeUp2MWtHUzFBVGxw?=
 =?utf-8?B?RFhpQkdPU3FtUEc4bzlPMnlBVTdrRXZCdW82SzZTakI3TnZGZ3lEZVNwT3c0?=
 =?utf-8?B?Z1p3bXJmMmg1MWRwSzNoaExpVmdDVzBjMWhtU0hJQ0V0NWZVNHZpeWhYZkh2?=
 =?utf-8?B?ZlNRODdNdEp0WjExVCtDVmlBcW1JQ29abTZVNVJRNGhwUEo3TlBNeENtS3Fo?=
 =?utf-8?B?S1doUzYxWXFCVDNjM3I0N1NadEJDYi9WYmRscEM5T1NlVjVzM1lkT1FGaTJs?=
 =?utf-8?B?T09GdDFtUDNQZGdyQTk0Mmg2TGkzbG9wZzBORklPTFh0clNMMVRzR2tIN2dz?=
 =?utf-8?B?U0wyU3lUeDRzSDFaOXRwd2trVFI3MVdrL0JMV0luclI4cmlKbUFEeTVxdG9Q?=
 =?utf-8?B?L3pVQ3Z1VVlVR3lTRkVDZ0IvQXkwcW1GYlAzWjVteHZOcFNHbGMrK1F1MFhF?=
 =?utf-8?B?blc5VXNzYXdSRSszZVYwZFN4UzI1dW01emFqOVFVeVpYd0V5Z0tzbkZ3R0pm?=
 =?utf-8?B?cGRYYzk0UGxDbkFkWGZIR0Q5YjlsMHFNT282U2ZwT0tuM25SdldEcHk1aVFh?=
 =?utf-8?B?MVlPM25GQkc5V1hqeU02c0Z5WlRTeTNudzF0aXpqcGRGOE5ZaUFicEkveXRq?=
 =?utf-8?B?V1NDY3hpQUhWT1dSemxVT005VnUxcFlvVk1pTlQvemNGV0NqZloyRXBzSXd3?=
 =?utf-8?B?THNENUpGUnJlNGdZVVRZVTlmd280NENuYXY5NWdSdVRZU3NOS2dUMGVwVUpl?=
 =?utf-8?B?YnROZzVMTWgwSk84V3NtK0pxRWRvdlgrUWlhaE9oUUovRWkxem81MUxqSlI3?=
 =?utf-8?B?TzBlQlZiSjdlR043aHJTa1Q4UFNEb05Lc3lweTlvVHdIQjNHdzEwV251dmk5?=
 =?utf-8?B?VjBzenpaM3JscnNlWWYwZXhrRjR1Z1JxYkZ2NHEzOG4vWjZIL1JIRTlqNGpD?=
 =?utf-8?B?NnNkWTZrNXlhUXRORDNqSktrbXhkVVE1OEgwV2FNVXFKTVFCUGR1Qi96MFNK?=
 =?utf-8?B?azg1eXBXTlFDMDJFOHpyZk9SMEM0cFVYWCt5ak50L0QzeHhacUEyemhZd1lD?=
 =?utf-8?B?VVhPZWhMYVRLRWFBNnYxUXpUTXlRRVREeW5Ba3BtLytpNDJWV3dTemMwVTA4?=
 =?utf-8?B?TmJBVzJqMFJDQzNJMjZTRG9SSkZUQ1ZXWUlkTnIwcWJ4T00yRlR4KzZWQi8r?=
 =?utf-8?B?Zmhmem5JRmNSZnVaenJlZGt6OTlXWUVwWkRXckJLdmlwTnRON3RUbVExMGxr?=
 =?utf-8?B?ZGlxQzRWSjc2akt2b3ozTFVuZlFBMHk4KzdHc01iQW9xTGFhVnAxWGlxdWYr?=
 =?utf-8?B?UUIyVlhWeXkwME5OSXpEN0ZZNG9VTHMrWnVOWGpYd1J1SUFFS24wcUo5YnFp?=
 =?utf-8?B?VEhJVERjSGQxOXFPc2pGU0RNbGlCYjRraEJERGlwMEc1Y0RNNEtxdG5CVmI4?=
 =?utf-8?B?dzZQT3dxc1A5SXdGS0VMWTVBZng3VVhLU1hTZEJHQ0t6ejZ2cHF3Z3QxOXFz?=
 =?utf-8?B?U3NaTTFTTVJ3NTVlZzBsY1VRZ0FWcWFUNjVkbnVLdTR4K0VDdThUZTI5MERo?=
 =?utf-8?B?V0o1RGVvd1RzMDgwYm5vSGxMbm5DTGMyS1cwYlQxb1QzZ3VSTUxqVStUTFcr?=
 =?utf-8?B?Y2pvR1FDSUZ2cnhuME1VSWFZdFNUZzZSZG5oekRXczY2aklpNXNGRVpXdERZ?=
 =?utf-8?B?UG94Qkx3T2dZV1Q2NmpjTWlMdVMrOFpKemgrOGZzSkdRclp5cTcvMEpudzQy?=
 =?utf-8?B?bjg4N3BvajNrTC96NWl2dmVqOTNxQlpMSjl4SnJqUVZSQjlyVjlSYVllcEFM?=
 =?utf-8?B?UTladTNaS1BrSW5xeEpoMUh3a0RJSy9lODBZUzJvcmlzUERhR1VYOU1hVHF2?=
 =?utf-8?B?a3VYa29yZVlQRUk1c0s4czQ4bXlnbElXdHVaMGZXeUQ0VWVvWVZ3dUFKc1NL?=
 =?utf-8?B?VTNBVmYvRGdaMWRWN0ZLZEhjOFpjWDRGYWdwVHR4TlJJdDZOU284M1hzYUJt?=
 =?utf-8?B?Q0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2112ea68-97e7-4b70-79c4-08db0e7bbbc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2023 11:07:59.6373
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SmWPDB0x5OzLSSD5Eu2MPFtGBK2ATpPiMJFtBFhB6Iulju6pc0CWxecBfYqJ0lPpK9iCf6ivwPgYTyYdC4CgruNozhz1h7Bs60Jh75qYz+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11716
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        RCVD_IN_VALIDITY_RPBL,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgSmlyaSBTbGFieSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIHYzIDEvM10gc2VyaWFsOiA4MjUwX2VtOiBVc2UgZGV2X2Vycl9wcm9iZSgp
DQo+IA0KPiBPbiAxMC4gMDIuIDIzLCAyMTozNCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gVGhpcyBw
YXRjaCBzaW1wbGlmaWVzIHByb2JlKCkgZnVuY3Rpb24gYnkgdXNpbmcgZGV2X2Vycl9wcm9iZSgp
DQo+ID4gaW5zdGVhZCBvZiBkZXZfZXJyIGluIHByb2JlKCkuDQo+ID4NCj4gPiBXaGlsZSBhdCBp
dCwgcmVtb3ZlIHRoZSB1bnVzZWQgaGVhZGVyIGZpbGUgc2xhYi5oIGFuZCBhZGRlZCBhIGxvY2Fs
DQo+ID4gdmFyaWFibGUgJ2RldicgdG8gcmVwbGFjZSAnJnBkZXYtPmRldicgaW4gcHJvYmUoKS4N
Cj4gPg0KPiA+IEFsc28gcmVwbGFjZSBkZXZtX2Nsa19nZXQtPmRldm1fY2xrX2dldF9lbmFibGVk
IGFuZCB1cGRhdGVkIHRoZSBjbGsNCj4gPiBoYW5kbGluZyBpbiBwcm9iZSgpIGFuZCByZW1vdmUo
KS4NCj4gDQo+IFNvcnJ5LCB0aGlzICJXaGlsZSBhdCBpdCIgYW5kICJBbHNvIiBpcyBub3QgYWxs
b3dlZCBpbiBhIHNpbmdsZSBwYXRjaC4NCj4gWW91IGRvIHRocmVlIGNvbXBsZXRlbHkgZGlzdGlu
Y3QgdGhpbmdzIGluIGEgc2luZ2xlIHBhdGNoLiBQbGVhc2Ugc2VwYXJhdGUNCj4gKGxpa2UgcHJp
bnRzKyZkZXYsIHNsYWIuaCwgYW5kIGNsayBjaGFuZ2VzKS4NCg0KT0ssIHdpbGwgc3BsaXQgaW50
byAzIHBhdGNoZXMgYXMgbWVudGlvbmVkIGFib3ZlLg0KDQo+IA0KPiBBbmQgcHJldHR5IHBsZWFz
ZSwgZG9uJ3Qgc2VuZCAzICghKSB2ZXJzaW9ucyBhIGRheS4gV2FpdCBhIHdlZWsgb3Igc28gZm9y
DQo+IHJldmlld3Mgb2YgYSBzaW5nbGUgdmVyc2lvbi4gTm8gbmVlZCB0byBoYXN0ZS4NCg0KT0ss
IG5leHQgdGltZSB3aWxsIHRha2UgY2FyZS4NCg0KQ2hlZXJzLA0KQmlqdQ0K
