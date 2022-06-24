Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46F9F559648
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jun 2022 11:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbiFXJSU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Jun 2022 05:18:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230191AbiFXJST (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Jun 2022 05:18:19 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70071.outbound.protection.outlook.com [40.107.7.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8235449F23
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Jun 2022 02:18:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FANhHO5697mHL8Q5dct5MqdxxvXShilJb6BfbY6CGaF6BKiay5g46ZZNr+Ta3nmKjFHfVCXvbY51nbcNKwMuF4UIO/5uEAzKThvTA70z8+P3+C3Eq4cZ58e8v9WMWbPtVQtkmDSGETFle3VazdokrjqMgBByrs1TpJUBzB3gia+14SCYTHKXgVWxsyJJMuSBrp8q87A69rS6u317V/7gVdP0ABvdutnH4bi7eVlK4puDI7eU/JjtBTU8MwBn0fttMpWwCvEm6QlLpHYELZhDqKAMzijXAe9YpqDT5043hs/76IqSHOpY+LBsMnyzEbjUm9i0qVM4htN3UikRJu2hHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VPeXx+Qz/qsTNsKEyhAgnFcAeh+hHu9JgqA+fRLA2qE=;
 b=K+INMmLuchCwwFsgKp+tDNim1v8WsBg4SPDIt3S2i++IHrJUMiIcN7uNEoLfH3J3rkacWTbueF8biuWpUFkMLAQ9LMQn8GWTO4V6flG/ND7kQlR9XAQ+2zB+UXa90lddWSdj+blN6IPBvFCVg13DSDMpsCZevP9aY+xMBG184sAILU10aGwxWjqtD1dbyhoO0A8yFF7mEObotditBJmkgXyUy1AgBUXLlAx/iPMUqRrbNyUDXcNc9OQskIVpjRqEpcQe828CSYaVyyOxDZiIhPZ0nMyGnDz7yLMzoWqsYqFYr4VagTB171cUjsMm9AUY24baWyRCSvfbIXzB3nTCZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in.bosch.com; dmarc=pass action=none header.from=in.bosch.com;
 dkim=pass header.d=in.bosch.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=in.bosch.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPeXx+Qz/qsTNsKEyhAgnFcAeh+hHu9JgqA+fRLA2qE=;
 b=Ndvi4z/02bxkaUvk4Cy/fRO3AmaBPjFGsvay/dZmS8sPkQNAa+o/EYUzBUJi+Ct5gOoRosIbkpir77eF7zMKeC2X5TEmUi/sYDpL44pLSseplQaZVOfeS9aYsQYKVdiLZwXMJYi2HwUvxHlqijPXO+BwmrqOk4ntAj8RwVt+ofI=
Received: from DU0PR10MB5220.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:348::7)
 by AM5PR1001MB1187.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:203:11::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Fri, 24 Jun
 2022 09:18:14 +0000
Received: from DU0PR10MB5220.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2d1a:8dbd:1413:94e0]) by DU0PR10MB5220.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2d1a:8dbd:1413:94e0%9]) with mapi id 15.20.5373.016; Fri, 24 Jun 2022
 09:18:14 +0000
From:   "Harsha Manjula Mallikarjun (MS/ECF3-XC)" 
        <Harsha.ManjulaMallikarjun@in.bosch.com>
To:     "kieran@bingham.xyz" <kieran@ksquared.org.uk>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "Friedrich Eugen (ADITG/ESM1)" <EFriedrich@de.adit-jv.com>,
        "Rajendraprasad Karammel Jayakumar (MS/ECF3-XC)" 
        <KarammelJayakumar.Rajendraprasad@in.bosch.com>,
        "Nguyen Trong Vinh (MS/EMC31-XC)" <Vinh.NguyenTrong@vn.bosch.com>
Subject: RCAR CMM : features and improvements
Thread-Topic: RCAR CMM : features and improvements
Thread-Index: AdiHq0MdoOIlwiGdSt6SiaOtDp4JMA==
Date:   Fri, 24 Jun 2022 09:18:14 +0000
Message-ID: <DU0PR10MB522025BD0BBDDC94CC87AA45DAB49@DU0PR10MB5220.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in.bosch.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a547d6c-fb40-43fd-ebd6-08da55c277a6
x-ms-traffictypediagnostic: AM5PR1001MB1187:EE_
x-ld-processed: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q6OmWCs7EUYsPHHD2GmCRbs6pQrTR9exrYAv/7RuCx5geBVACLgbmmdK53mRxmsjNFlcSj4pyCcTrdy4r2/X+1F+afs6QhUyGQ+tBUzmi8nULaY0uKoiww78m29qIUua8YIO1Ma2A0J56fxCGktGTt3g1XtQctQeyg8yyVTOIE9MPpkNshyfW4gFVNjvhMGfDNqbBBkz7oOUJmyGUQNcjf1Ico7GRIIeuF4i0o2ZPwKoh1t014EfQsAL0EY7m5QNbtilHih/ZQImIODcXoBnpH4bxVfHui/2qudt/oSVbz924vdCN27d4Bur+isyIW77kGMXT66bS5aoXieUCcpUZQ7l7WLgrjIW0YQnkeMRawFVngNEcoOqqcFrMK0y6hMMEJpD/rd+PHgrSv/KAtN3BLL7vXWncOw4Zdkx1/PGa3SsAKA3Aq4BdDOgid1eFQljoHNfjVZ75BoImSVR4tcNdM+TFvF/Ah9G4Rq5H7VAQkhYYn62AnLAO7rX+2Q5R80DMQgp+XcYYFL99w5Y72ThURQVW06gTIk+NITgs3J7P3AvaHZMxrv7JOJH3hFpnrF20Yz8crfCHxpoVl3+b09Sd4OAF0ZpbL7wduYuKvAttLYSM6yt7SEJU3boqbJpdm3E6i0cHm+cMlVifj7BdlJsk+308xtVpkNeYkqv8GlxBnJhvr5czD/o8BPkVbvqlXDKuLO4/nHnWmz3rUmRqUah3ysegkwaVhfMar09Uu5+I2ImM/6UM/pbpEO1U3mnr9oPgJrTCnLTod4qsMvBg+qEgAK++E/OmsvDS+36yB9RkAaknL4iYPag0UiKH4s0E81mQkKWGV/TLflyNHWOxhiXsQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB5220.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(39860400002)(396003)(346002)(136003)(107886003)(76116006)(55016003)(186003)(66476007)(66556008)(4326008)(66446008)(66946007)(8676002)(64756008)(110136005)(54906003)(9686003)(26005)(41300700001)(71200400001)(83380400001)(7696005)(6506007)(52536014)(966005)(38100700002)(82960400001)(86362001)(2906002)(316002)(478600001)(5660300002)(33656002)(122000001)(38070700005)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ym5SMkpsR0FRVmNSQ29wcW5zK1BMQ2MvM0tjQkZ0L3Z6WE5kV3U0TU5mZENx?=
 =?utf-8?B?ZmVBcTJHdjdDbjAyQ1ZOU0c5TGk3NDVOenl1ZjlDekZpUkRlTFg3aFRLKysz?=
 =?utf-8?B?ODNReXoybUh5K2M0ejFjWGIwSU1vYjNBQTlSa2V6VUlUZWdkcStkb1hNVXpn?=
 =?utf-8?B?TzlLNGluT3ZTZTZaMGo4VGpQVytLZ2draXdteDJDUWk1Qm8wS3hUYzNldXVq?=
 =?utf-8?B?NklyczlpN212bzBWcUp3Rnd5UG5KTHVHR0FDS1Jwbk04dTloQUQ4UXJNV2tS?=
 =?utf-8?B?MHpCQnVSUGRsNEhpdGFJZmVjaSttaktidkpHbUx0OW5CczhsS2NXSWJ5VjBK?=
 =?utf-8?B?SmErUEVhb2tnVmFvSm01UjdHQnJPd0plVUVJdkJYeTJKT2JxYnBrSW5kVlZG?=
 =?utf-8?B?WWJDUzBValZXTmFVMUVMZHV3dUU5TWNZY3hMUWZrWVFqOUpITmxYbXl3SHdt?=
 =?utf-8?B?N3FQR2IyVE5OZWZFcngwbkZGbjB5SEdXcXhPTlgzRFduRS94UnN1RWVOTFVj?=
 =?utf-8?B?UHpUWm5GaTRHWXhGWWFSTjNFd1RyYUd0ME5iZ3BzbEU3TStvbnp4b2NnRnJX?=
 =?utf-8?B?bkJmaURlcE1ydW1LTEdSdVE4a2xPRXRTYTF2bHlZMk5jdFN6dW00V1ZmMmZG?=
 =?utf-8?B?KzhtbmRLUUpJREN6US94ZzdGVlRKZ3FLd2FkdzN2c3pVWDltYUNSQ1dQN0hC?=
 =?utf-8?B?SzFaQW5hR2Z1dG43Yms5OEpNakNOdVkwOGc3T1hCUkg2ajlTTHphK3RnbWxv?=
 =?utf-8?B?WEVIZlNXd0Ixd0RGaXIzVE5SakkzUmprOUdUNWZIVTQ5T0Zock4xUjB2V3lu?=
 =?utf-8?B?ZVRybHByNkg3dFZOckd5K2xQa1I5cDAxVjFZVzN1MjdnaFdHbTZPeEtuRktP?=
 =?utf-8?B?cDR5LzBLL1kwVS9LVFVDSEsvVU5PUVVCQzJLb1AvdWZjdWNSaTdvcVR0b3NR?=
 =?utf-8?B?M09aWTZzc2Myb2g4WTE3MHo0WGg5ZTdOcW9tTG9xZmVVYnU5QzM1cDI4U04z?=
 =?utf-8?B?QVlRRzgwVFA3eGo4NWhGbDZYQkI3d3NjeUFZNUJRWVRZYkd2azVsMUh3TUlV?=
 =?utf-8?B?L2haS2ZlamcxZk5QRUV6UE0yamhicTN5d3VSZjgrK3d0ZWV6TzFheUJoTTRK?=
 =?utf-8?B?NGZvMi9DZUhrcXNQdXR3amVhdGtlRXBEa3U5c3lEMmpQdG9VVnBJZzRGSVZi?=
 =?utf-8?B?TWh5MG52bDlwYlEzRzhldmh1Q1JEWkZ5dlNBa0VCTi9OYllreHMwNFZFbGJl?=
 =?utf-8?B?SlpLWHNweFJBQW1yL2RDREQ4MkZ1dUhTWUdxMlNTbXg0dGhaOEZyVTNvVGJ1?=
 =?utf-8?B?S21uMFBjYnVuazRGQitDZVdGM1YvQ3NCY2xmVisybndVZ29MeTdidE5aV0E2?=
 =?utf-8?B?NWRtK1JwV1cyYzBWOVRlQStaT2lmNnl5c01HK0xQUlMxM1VYM0FGUWpJSzh6?=
 =?utf-8?B?NkY0SEtxaFlSSUg5dWQzdU1CbVk2NkhTbjBha3BIWGNqNmFYc0hvcnpxb3dp?=
 =?utf-8?B?cTRsb3A2R0o3UXlJaTVqbEhUU0M0eTdmazg3cUQxM2Q0aXBHUzhPZWdNbjk5?=
 =?utf-8?B?c2VKTDJwVStGTldVblVudXd4blpqdE4rNkx1eDNxcWlJelNjaWNMbjNLQVNo?=
 =?utf-8?B?ZTJ1L2c4Zm02S0VSY2thbUx3KzdGdGlhYVNZaGlRT0JDM3F2V0pmM2ptUFdC?=
 =?utf-8?B?ZVZxNUZDWGtmWDVpQS9pRXlTczRqMEN3Y1NIR3ROSkhJdVNPQjlEY0lTWm5Q?=
 =?utf-8?B?UlZtczN0bXAxNmFwK3YyYlR6aVlYVnc0eFllRllaUWswbW9LdkhCNGNJc0dF?=
 =?utf-8?B?cWJ6S2pLQzhLMytYdFFIck13c0dlUFdXTkJ4RXJLeVljRXp5LzJvcEpHS2RO?=
 =?utf-8?B?c2s5alhVUklsQUFMNWRYLzNSR0JyVTRzd0NpZHpKQ0duMXlvVzduWk84Z0lH?=
 =?utf-8?B?U3NDdWtsVWszMHJCV1hyR0FOQ1VYRDlheFROZkwrVGVVM2hESjRnT1B6Rm1Z?=
 =?utf-8?B?NjZxb0lGMkRPVXZlMCswNGZqakR3aWtDYW5TNVc2NUFHSzdXY2pwTlVuT0F2?=
 =?utf-8?B?azlUOUVTeTQ3cW5kK1RnL2t4TFZNbklkMXdsc0hlTzJaUEhJcjJROGhobGdp?=
 =?utf-8?Q?2Swc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: in.bosch.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB5220.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a547d6c-fb40-43fd-ebd6-08da55c277a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2022 09:18:14.5634
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 20HLcWckLKR4n+R0lyZ47Pe/mfITVcAj3+i3I6t3XbHS62EfwAjPtE6acVyprv4IQU9eqwKq8zKalxtvebkWaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1187
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS2llcmFuLCBIaSBMYXVyZW50LA0KDQpXZSBhcmUgcGxhbm5pbmcgdG8gcHV0IHNvbWUgZWZm
b3J0cyB0byBpbXByb3ZlIGFuZCBhZGQsIG9uIHRvcCBvZiB0aGUgUkNBUiBDTU0gcGF0Y2hlc1sx
XSBhbmQgdXBzdHJlYW0gdGhlbS4NCkZvbGxvd2luZyBhcmUgdGhlIGFkZC1vbnMvaW1wcm92ZW1l
bnRzIHBsYW5uZWQuIElmIHRoZXJlIGFyZSBzb21lIGFjdGl2aXRpZXMgd2l0aCByZXNwZWN0IFJD
QVIgQ01NLCBhcmUgb25nb2luZyBhbHJlYWR5IGluIHVwc3RyZWFtLCB3ZSBhcmUgaGFwcHkgdG8g
YmUgaW52b2x2ZWQgaW4gaXQgYW5kIGNhbiBzcGFyZSBlZmZvcnRzLg0KDQoxLiBEb3VibGUgYnVm
ZmVyaW5nIHN1cHBvcnQgZm9yIENMVSwgTFVUIHRhYmxlcy4NCjIuIEFkZCB3b3JrZXIgdGhyZWFk
IGluIHJjYXJfY21tIHRvIGFwcGx5IHRoZSB0YWJsZSBzZXR0aW5ncy4gVG8gYXBwbHkgdGhlIENM
VSBzZXR0aW5ncyB0aW1lIHRha2VuIGlzIGFyb3VuZCB+N21zLiBUaGlzIGxvb2tzIGEgYml0IGhp
Z2ggYW5kIG1vcmUgaW1wb3J0YW50bHkgaXQganVzdCBibG9ja3MgdGhlIGNvbXBvc2l0b3IuDQoz
LiBXaXRoIHRoZSBwYXRjaGVzWzFdIEkgc2VlIHRoYXQgQ0xVIHNldHRpbmdzIGFyZSB3cml0dGVu
IHRvIHJlZ2lzdGVycyBidXQsIHRoZSBkaXNwbGF5IGRvZXMgbm90IHNob3cgYW55IGNoYW5nZS4g
QWxzbywgSSBzZWUgYSBzaG9ydCBmcmVlemUgb24gdGhlIGRpc3BsYXkuIFRoaXMgbmVlZHMgdG8g
YmUgcmVzb2x2ZWQuDQoNCkFsc28gd2UgaGF2ZSBzb21lIHBhdGNoZXMgZm9yIHdlc3RvbiBkcm0t
YmFja2VuZCB3aGljaCBjYW4gc2V0IHRoZSAzRExVVCwgYnV0IHRoZXkgY291bGQgbm90IGJlIHVw
LXN0cmVhbWVkIGJlY2F1c2UgZHJtIG9iamVjdCBwcm9wZXJ0aWVzICJDVUJJQ19MVVQiIGFuZCAi
Q1VCSUNfTFVUX1NJWkUiIGFyZSBub3QgdGhlIHN0YW5kYXJkIG9uZXMgeWV0Lg0KDQpbMV06IGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1yZW5lc2FzLXNvYy9saXN0
Lz9zZXJpZXM9NDA0NjQ3DQoNCkJlc3QgcmVnYXJkcywNCg0KSGFyc2hhIE1NDQoNCkVTLUNNIENv
cmUgZm4sQURJVCAoUkJFSS9FQ0YzKQ0KQm9zY2ggR2xvYmFsIFNvZnR3YXJlIFRlY2hub2xvZ2ll
cyBQcml2YXRlIExpbWl0ZWQNClRlbC4gKzkxIDgwIDYxMzYtNDQ0Mw0KDQo=
