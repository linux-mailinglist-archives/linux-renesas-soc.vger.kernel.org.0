Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7F0350EC91
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Apr 2022 01:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233297AbiDYX2l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 19:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231223AbiDYX2k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 19:28:40 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2099.outbound.protection.outlook.com [40.107.113.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5334D3334E;
        Mon, 25 Apr 2022 16:25:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bacz9FSkcI6+knyYMWHwcl3ShOdpIk4i1RHG1rdmAlkTjKlFrkxVL1kWbMHm2hEccr3/sqjMZhkSK9NGeApejshVw8HN5VDkBO3VoiYhAfTK+0am3rWpSk4Xi/KGiVQsS46GpHhbCa2GCqIckOmQ5KLeROL1jwOo6V8dm6r41ZfZmuDhKMrjs6L7eos0KCVdSd/u91sMgeqxP3CoJjefyh6fitryyyN1SiRGQe/9LfFO5ygHDU86xxmhIaTkFFjcxzL6rVe1PhAIm+z/NTGjdhpJvdk+GL+F8ZZEnNCXVrVNCDPpT+YFcd07QwGrVkMm2wzAsm5Y8qzSdGhly3VDwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1aZUXQPVi3cfwSCYe2kKz0etFJroBoUky37eSm23huQ=;
 b=h3tj7B8cUGIvEzzJ/Sp8XRQ40B2JgUlIiS8N1YBRSPf2VIhZYxlh/UjC1DA9jJVDcOMrZNTeiIwYhtuU1+29q5X8PF8ILAXfddMvGmWnrfEmS8638WczSmJnh2gj1yIG1OaBScONOMYv37pV09vRCa4jcZjgsbdmPyTbHCoQJxTMUwHenzjc4rCm/qQ2Cu2s32YOvDLoSXXiDZ8tIHDeLAM+eemKpa58CdoUxPIpPN8XKco9ETUjqdA2zaEBx4iX8EPzB7FyMJUIVW5eQPjMUs02q8RYl6mjHU8ZqtBF7Za16aSUVneAxLX0c0RuCY3T/vXRGZAuweljj3UVpcmeiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1aZUXQPVi3cfwSCYe2kKz0etFJroBoUky37eSm23huQ=;
 b=ZG0y++hB2hhbc6GqeYGiqUCThbhHkJGxJV2FejS+74SmPI2GOS4ksPgAQNFqcJGF9REl4mEFFJ6B/B/hTuZwoTLaPeOcKdacof4vQkzrqHcIzxyKhTGOSkQGlP0PWvewbr+NPg5lI+9u8k0qqZgFrenoLND9CDyWUNVuVFRm/Mk=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TY2PR01MB5177.jpnprd01.prod.outlook.com
 (2603:1096:404:117::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Mon, 25 Apr
 2022 23:25:30 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 23:25:30 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Alim Akhtar <alim.akhtar@samsung.com>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        scsi <linux-scsi@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 0/7] treewide: scsi: ufs: Add support for Renesas R-Car
 UFS controller
Thread-Topic: [PATCH v4 0/7] treewide: scsi: ufs: Add support for Renesas
 R-Car UFS controller
Thread-Index: AQHYVGIGtXoFbXgGNk2x4ymZB/vtuK0AypMAgACC/2A=
Date:   Mon, 25 Apr 2022 23:25:30 +0000
Message-ID: <TYBPR01MB5341306C3F0C5F556C0623D6D8F89@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220420025450.289578-1-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWRQYLK49pMKJ6b-SVK91brrEJvD52cyyLWTwAT0z3Cmg@mail.gmail.com>
In-Reply-To: <CAMuHMdWRQYLK49pMKJ6b-SVK91brrEJvD52cyyLWTwAT0z3Cmg@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f4e0a0e-9292-48ac-0143-08da2712e397
x-ms-traffictypediagnostic: TY2PR01MB5177:EE_
x-microsoft-antispam-prvs: <TY2PR01MB5177D3B433F86D2A1ADAF9B0D8F89@TY2PR01MB5177.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qJ+DbuUZDu4JwdW/FzjKjeshhPJPyFCDTfQ7D87RiTh0A459mSk4MGcOw39q8FADW3kBqOgSu4SnkSqXBCw3A20kqgs/ispCSHsXDXJ5HTI98juWoEaIRpYrYTrBU2hGXVrMXvHY8G99vamSidHoqRj1tAK5vwPgjkeMDZdLD+8ecgHH2VN3cXHOI3CzKBecc85Smnq8w2C4BRvYC4gbjHd2rnjtVxenk+/9MOs5vbAcROsg4OaEs38WFwhQb/cFVjMQUk2fkQQhq2YDGdfNvcFSp9n8JG0GEHEiADuWTpL7JzrWo77YHqqaoTUVE/uKJmSCKG7zwP2Woi6NqMQVHhOycB7mB3nK+ErgwYvQ6C+bfo64kbh4DLRHDGY3O3Hd6KEUOgulJ02u5h3RJ9/jglT5WvMhN6fAeJa4vkWU796jKi5oMbOH3Ld3IP/381Dhg5locoFhCPVgU7k4fXRrtqbNM5p1PdSMDy4wbBSTbQn0hj6c/bfW7V51qvkY0nJ2yDMluDthwAEZw84AF7YEvrJwJxLM/Ii7vh11LSDZW40opvV15DxA0X9AI56oQkh1HZJvPpeEkhyhN/VjB2Db0/OJMf5FBg1+cRI54Su57jYMPl5xxWOf6kbAPCjG7wTC7EivHn55mbLk7yL/a6ix02End4l7hr5g/f5a05fxInYYD0PKkfIfVOYp2buVr/AiMzsh7tfudOz9oPcF0C5woA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(316002)(2906002)(5660300002)(7416002)(38100700002)(8936002)(64756008)(8676002)(4326008)(66446008)(66556008)(76116006)(66946007)(66476007)(122000001)(38070700005)(52536014)(83380400001)(9686003)(6506007)(7696005)(53546011)(186003)(54906003)(6916009)(71200400001)(508600001)(55016003)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFpoWTVmWk05c3Rqb3ZuRzVBaVpBdnRGYk1qVkc2bTFkWUJIdERETWVDM1pa?=
 =?utf-8?B?Q3ZVcWxYZ1hleFhaMVk0dy82bDRiSDBXY0RWaFRlSkVMcCtLMVdYRWc3VFVH?=
 =?utf-8?B?QWNMSUNvRzhqVGZUbmR0Uzl6WXBoWmRoVE90NllNTEN5RndueXRvejB3Nysv?=
 =?utf-8?B?cHQ4RUovV1loOTFxWUF5NVR5U2paSU9RZXJRNmdHdGMrVTN3VzdlMVhSZ0c1?=
 =?utf-8?B?TUtadHRvMUowNHptRC9aSldiaXV3ZVR1YTBIelFQL2kxTG1SUFJ0aUNxZTdC?=
 =?utf-8?B?R0NvUy9RMzhyZm1IZW1PbjROU25BZEREY2Y3SGJvV3FuTnlib1ZaTDN3aWRK?=
 =?utf-8?B?NlpDclVGeDlrWW8xNXNZRjE3UlVOTjNleEtxU1FZQmJ0byt3QUJLYnI4Z3Bk?=
 =?utf-8?B?WVRlc1dSMlIwK2lYbHhHVHlVbTVPejdIYmwrQVdUdXFPL0s5VkNrWW9Lb0tN?=
 =?utf-8?B?cDNOa2J4cnZEcFgxblJjZWR6M0RYajZhYyszVnI2UHBIV2RaM1B0NVI2VVZJ?=
 =?utf-8?B?UGM5U0lGYjdsTDIxZXFuTUNYNkx6SlZyTjR4M2VvTU42RGFPcWV3bCtxSUlw?=
 =?utf-8?B?TkcxQ1FlMk1FcUR6bzBuTzdRckVYdm5MdG9ZdWhwZmpMeTN3bit0eDFQdEtC?=
 =?utf-8?B?QzhnVjZUSUJZbVRzZWdaV2F6QnlVL1Jta2pudkVDTmtNc2tmYzhVVDNGNlZp?=
 =?utf-8?B?dlAzcmJ5SjJzZm5WcThENG1WeWZYaGtNWnorNnJNckdIM0JQbGkyUFRKeTQw?=
 =?utf-8?B?bzQ3U2wwK2ZXNU1BM2w4NDlWZE5hTkdhT2Y3U1JpUUFNMjFZKzlHU0dwWDdS?=
 =?utf-8?B?cU9ldjFYV0FqV0FySmg4dXB2dFN0WWFPR2hnbzVMQ1JJUHZzRWdyZ0dma2VO?=
 =?utf-8?B?L0RIZTFMam5ZY3hPYVZqU0w3b1kxS1hnMk0rdkpsWXBWRExMci9SRHdNek4x?=
 =?utf-8?B?N1FjWHVsdGJndnRrVlhsckNNYlRuU2hJNWIxMHV3b1lLSEsvbllCUlRCdm1h?=
 =?utf-8?B?Ulg0Qkpmd21oYjFTUzhKNklQUkFqbWhydGFoNkVyZjJjS2hFbXRuKzVZbUdE?=
 =?utf-8?B?UFltYkppNER6VGtuSlFGOHE0OWsyKzdLU2lDejR1eHdERGtFUnN4eWJUYmtw?=
 =?utf-8?B?ZS9NZUtkTmRKWGNtdEhnUHhsaW9CQk0vdWhuclJrdDd5NFF4dm54Yi9qUkNl?=
 =?utf-8?B?SVNKSjM2UGw0dVBSK3Y3Q3RJdEorVElwNjNpcnBHMU80bllxSHhUenNTbkl0?=
 =?utf-8?B?TnU0Y2kvNHUvMUIvdjZlVDhnYmc5T3NRQ3U5YUZXVWVhR3pIMzFHNHpYVXBu?=
 =?utf-8?B?QzdOZHRoYTJoL2doTTZtYk5TdUd4YnZ5ZXY5bVBKTVY2Zlc1bC83cWFBaGlS?=
 =?utf-8?B?TlJERnBoQ2J4eWp5YUIrWVBVTHMyNVFqakdadlg0QnNyZ1FFN3dJL2MzTWd0?=
 =?utf-8?B?cFZRSW9adTBqN2xOK21pajJOU2F5RlE1Z3YrYXhqUTh0ZFFmZG1VbTR2bFpz?=
 =?utf-8?B?UWZMenMyNkNua2lnQ1VjMXVMUSttTEhMK3A2US9YdE5GenFtUmJmK0p2L1BK?=
 =?utf-8?B?ZmZlYko5ZVFpbHV4UEw0bEdydDAzT3M4OHo5MUFleXpDM0Y5eDVtakpPTGwv?=
 =?utf-8?B?VUQ3K0Nrb01uVXVJQXRGZUNMc1NpQkVMbWRTaFhGa3liOThoS3hlNytSK08w?=
 =?utf-8?B?alR4ZllwQ2tQU0xmZEhMaFpIN2MxU29lVit1cW1kQ2NPMmFNdDFDQXAvSVRY?=
 =?utf-8?B?dmhJUFA4UVpBU054VTNmWXpCOWpwdENKc09vWUFlTCtxM1RsSnBTczhWaHdP?=
 =?utf-8?B?MkxFTEZ4bnFZaFRjZGlYMktBMDdVcG9ZZGVYcjBZK2NOUHJtWUlTcUJtTzcr?=
 =?utf-8?B?T0NoOXpIVTRqOUxGYWZ5S0w4ZWt3YTNrb0JleUw3MTBBdERLcGRoTTBZS3BV?=
 =?utf-8?B?eHFkcGZVeEdEN1dxLzRJK1Y3WWRFTDNZV3UrcHFFZGx5bnVlZHFXZEJaY09X?=
 =?utf-8?B?d203WFR6UXQweldEenJxcTE1TzhGQ0dYTlRkdG1BaGhqaWsySDJORkR3Vlgy?=
 =?utf-8?B?aU9zdjZpV25mRVVraHdDWlUrQ2gxdkg2eTFjVDAwYnRYc0Z1YkVESVF1aWF6?=
 =?utf-8?B?N1B0ME1nRWw1N3kwNmkyRGJuR1R0K0ZWZE1pbXVKUGtWcUlRaTJMVGRJNzlB?=
 =?utf-8?B?bE5FSUxVZ25rZXE4dW15K2FGT1pmSUNXY0M1cDlGdzN0UUVxVGZhUktIeVp2?=
 =?utf-8?B?RTJxRWNUL3UwUnZZSFlrUjlpcXhwUUdiaUlXdGdpZ3pmbk1lYklVWlBEdlIy?=
 =?utf-8?B?YjRCcXlBOGNYNG1nLzlrRzZpKzN2SDI1WmRkN2FkZWNyUWNxakRKSmhTb2Ez?=
 =?utf-8?Q?NzztILQzVJTbiGXiCqRFnHOHhFLSSkINjvVhz4UTmblx1?=
x-ms-exchange-antispam-messagedata-1: jx0P6hRRLRh3zk/NwnT4GwRYQvs8dF51fu8=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f4e0a0e-9292-48ac-0143-08da2712e397
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 23:25:30.7409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qV/kn8i5/87TPRINrqa6Gv3Xbu/UMpJmSFj4RfaYw5rULt1RoLusUhr8R+p8OwV+52eDc+/mJqFW0XTq2sPIa/TJKzPb7ysN3dSQA0JOcVNOwwQmkQpbO+G63/hPajVc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB5177
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVHVlc2Rh
eSwgQXByaWwgMjYsIDIwMjIgMTI6MzIgQU0NCj4gDQo+IEhpIFNoaW1vZGEtc2FuLA0KPiANCj4g
T24gV2VkLCBBcHIgMjAsIDIwMjIgYXQgODoxNyBBTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8eW9z
aGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IFRoaXMgcGF0Y2ggc2Vy
aWVzIGFkZHMgc3VwcG9ydCBSZW5lc2FzIFItQ2FyIFM0LTggVUZTIGNvbnRyb2xsZXIuDQo+IA0K
PiBUaGFua3MgZm9yIHlvdXIgc2VyaWVzIQ0KPiANCj4gPiBUaGlzIGNvbnRyb2xsZXIgaGFzIHNv
bWUgcmVzdHJpY3Rpb25zIHNvIGFkZHMgc29tZSBxdWlya3MgZm9yIGl0Lg0KPiA+IEJlZm9yZSB1
c2luZyB0aGlzIGRyaXZlciwgd2UgaGF2ZSB0byBpbml0aWFsaXplIGEgY2xvY2sgZ2VuZXJhdG9y
DQo+ID4gb24gdGhlIGVudmlyb25tZW50IGJvYXJkIChuYW1lZCAiU3BpZGVyIikgYnkgdXNpbmcg
dGhlIGNvbW1hbmRzIG9mDQo+ID4gVS1Cb290IGxpa2UgYmVsb3c6DQo+ID4gID0+IGkyYyBkZXYg
MA0KPiA+ICA9PiBpMmMgbXcgMHg2YyAweDI2IDB4MDUNCj4gPiAgPT4gaTJjIG9sZW4gMHg2YyAy
DQo+ID4gID0+IGkyYyBtdyAweDZjIDB4MjZjIDB4MmUNCj4gDQo+IFlvdSBtZWFuIHdlIG5lZWQg
YSBkcml2ZXIgZm9yIHRoZSBSQzIxMjEyIGNsb2NrIGdlbmVyYXRvcj8gOy0pDQoNCllvdSdyZSBj
b3JyZWN0Lg0KIyBKRllJLCB0aGUgU3BpZGVyIGhhcyBSQzIxMDEyIGluc3RlYWQgb2YgUkMyMTIx
MiBmb3Igc29tZSByZWFzb25zLg0KDQo+IE9yIHRoZSBib290IGxvYWRlciBzaG91bGQgcHJvZ3Jh
bSB0aGUgY2xvY2sgZ2VuZXJhdG9yLCBsaWtlIGlzIGRvbmUNCj4gb24gb3RoZXIgUi1DYXIgYm9h
cmRzIGZvciBlLmcuIHRoZSBQQ0llIGNsb2NrIChCVFcsIFJDMjEyMTIgYWxzbw0KPiBnZW5lcmF0
ZXMgdGhlIFBDSWUgY2xvY2sgb24gU3BpZGVyKT8NCg0KSSB0aGluayBzbyBiZWNhdXNlIHRoZSBj
bG9jayBnZW5lcmF0b3Igc3BlY2lmaWNhdGlvbiBpcyBjb21wbGV4Lg0KVGhlIFJDMjEwMTIgYWxz
byBnZW5lcmF0ZXMgdGhlIFBDSWUgY2xvY2sgYW5kIEV0aGVybmV0IG9uIFNwaWRlci4NCg0KQmVz
dCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0K
