Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E492E78AEC2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 13:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231317AbjH1L0w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 07:26:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232284AbjH1L0l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 07:26:41 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2121.outbound.protection.outlook.com [40.107.113.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 157BC92
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 04:26:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gp0WAR/nNcjhozQSVs/04RxL90z7gG98YpxoOpvtKLcvcs7FyYvkVZ27aDBRBdbLrf3iDbPj2ykzVuiTKJOrqOA7gRqSgb6sMKQOELUba9iOPXfbqGPLQZMJygwd9yhUqicVMuzFpYBbRQ/COAsoPwh69iLIwT123pNO5QZVV17diJ6PKyN19h0CYfWKOj9VKPef6vV+lgFtzSMfk6YZVgJgU9hdiHIdN6bEuYVjxm7QhnCJZUz/Z+LyErZLFYRfNuT9JI9dcurdjtTnj4OopT06KMHo99DiVo9HDdntiaVUONMxHv/mWghdyQqKrjsDgvj9dC3ls8MVSn43IctoBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NkAckv9mPivs0pTEycJUj36U3jKbGB13VNi1m654bU=;
 b=jy2iX0VraAaW26rb2+FMCj9R/nxKvFJDl2eCStqIgRXz4aVSJldVuScF9ZovjTUPk/yDsUjJ9SqAGBMIyxZvxGsFiJbNMV7fH9kOA2BNhLl8Tc+6jpdDVylX9KAYvZ0RKwWiWeCzbS49e4s72ifWiz9ofGlAwDa/PRMCwGpUllZIkgFEd0x8N9GeI0V8r65oLV1Go3GCE3RywMlAyJWN51WEDQvaTOqSsfmv1xk0wCbt3lFzmvZcai0jBZGvBfEN3zTO5dmUZodEw0ibnbmwGsmgxRSBtCmRrI/zmg2JI3KbvF02O79WTQx9JOE93lu0/ZGgVTe17vV/jhtUJV9JGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NkAckv9mPivs0pTEycJUj36U3jKbGB13VNi1m654bU=;
 b=Xpmmejz1u9rGbze8relupoPZID0UgMxqAL6P/8EeAdrWvT4zEgVNTCM5zDcvXhddWutmdCybTkmMtsHnHz0kNj07uQAdmHxrsfHQGTyX4Kc/lA3JTEhxZ/lZU9BSVjZ1STcAzJrsckZYPF3Tj96scTZ2PXSHXiQ0A0IsrKpodS8=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5490.jpnprd01.prod.outlook.com (2603:1096:604:a4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 11:26:35 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%4]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 11:26:35 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] regulator: sy8824x: Make similar OF and ID table
Thread-Topic: [PATCH] regulator: sy8824x: Make similar OF and ID table
Thread-Index: AQHZ2EBwRSNBSWvZ4UiFqpzGSBFhoa//jEoAgAAH7wA=
Date:   Mon, 28 Aug 2023 11:26:35 +0000
Message-ID: <OS0PR01MB59228609398BEB5E0B2B9DEE86E0A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230826171158.82219-1-biju.das.jz@bp.renesas.com>
 <ZOx9iNd4tfiqPrx5@smile.fi.intel.com>
In-Reply-To: <ZOx9iNd4tfiqPrx5@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS0PR01MB5490:EE_
x-ms-office365-filtering-correlation-id: 59374831-b300-4440-8369-08dba7b9a345
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xXuygfKdTxwxBxFxD05+3/aJBSZ3ZUOyN4wHXVVtG4PdAfolmDAk+uFdwIxCj9OJH09x44nS9t+c9KK8Et4S6fZOwrOmhWVfewbKLvsMLGfMeJc2OMPqtyZG0KIxHRSGAxgF4dhR9mRnWaom+Lom9e1BmBe8Td7eU278OiKj/tLyfo3/M++jwHcE+SdriKZASq6Wus+bab105pvJlUcoqr4lrydFXY6CDCdLFaPxL2Qmn4/OsauL6rDxSfevudkC1WDJ3q/L7YMNKu8blQKM2CXb0/o33F3DsXjAtngY+ZEFe6crz7R8m1DJnfIBKC8hnvLbd9rg36mF1uqGvZiyG7spgPT8cqsa4TXweryga7vBSyi90MBkmlHKIbXk9Nvv6zmq3wwgdRbPl+soOELW19zSXb6CzBE4pOzaHb+JUN7UceBgE5lZDvWv3iTzmwYHmPO3J2obeNmBOSvqeaybU1rFXw4ZWqdzCVaXe6JYxvecoPAYbz4zztDuV/9EI5YBmvXS6MDM64+0ThxecJWLulHnaCPW6fSCd55vOe5Srbod9stLBMdEzIvdFtNtEqY8XSR30RtBICd7vM41Z/sNf1JywOI7xieyyDQKQFTlPRDJMCEoe44xN8cd6gfRhfOb
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(366004)(39860400002)(396003)(186009)(1800799009)(451199024)(41300700001)(122000001)(38100700002)(86362001)(478600001)(38070700005)(71200400001)(26005)(9686003)(7696005)(6506007)(4744005)(55016003)(76116006)(66946007)(66476007)(54906003)(6916009)(2906002)(64756008)(33656002)(66446008)(66556008)(316002)(5660300002)(8676002)(8936002)(4326008)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JKYLifVy3h7pFlnte/7RDcp5OW4pZciIWwIFbPHs2DFA6SC1lQEYj8JTbewu?=
 =?us-ascii?Q?j25Ng6SGdlV4kl4P2xup5iyHOxvzYZJpfTi6mM/Jph7FFZYeGcRixP5BvN0b?=
 =?us-ascii?Q?BCqwHOPnRPlt4yTUz0L/DnUs4j/rUJVYXr1m166IhY0dKutAZyzV3FSG7cBY?=
 =?us-ascii?Q?Sc7eAeF5eMJwNTQOo3dQz1+SyO2H1XJl0SiPMLjJVmHOrUP9U6rkg0sOBx3t?=
 =?us-ascii?Q?SubLonUz8qfHBOj7nmujCpdFZQdSNTPfz5ZHc1fza1kbzE4Zs7pYS91SKqsW?=
 =?us-ascii?Q?loFefCd/WgQ5rk/OVlEqbu5f4wEvtf21/LzsU3dn9qaiOdaDDHePMAuSmAj6?=
 =?us-ascii?Q?ukl+65ARvy9RJCua6r270BU+i7RXmMPf1OWLgWTQa9x/33s0o4AfCP4J09l+?=
 =?us-ascii?Q?Bzkhp0LlCta3QYaNAd3bgjA7lt6fCga8C/SjthHop+39eaZqodYLFe42xDEJ?=
 =?us-ascii?Q?i9+BX3gCngGu9YiLfyMPeCdH5rjiAEjWUcLb92cCBRcPMnkmqw7g9vYvSDeu?=
 =?us-ascii?Q?g9VZkhWVWqozKdDPee9PMLmXVK6V8Y5os60k1ih5mYriUWI23aoPxpkLnzZx?=
 =?us-ascii?Q?i3PFzdpN/1r3ImwAuptpOIFvGOQlf7sFDJTbl1L9j1EuI5MkYGiQfepSi5aO?=
 =?us-ascii?Q?nkBotHZhHG1rk82F4wiy0N5Rf2o0uKmkQpij9L1vw7KvW/r1/F/iYZxH/D5B?=
 =?us-ascii?Q?CXasOZ1E2ZBJCeGQ/5zx3Rh6ImVNC3eNbwYolC6cpbVnAmd3GFpv7ba+Xeyg?=
 =?us-ascii?Q?jbw2JOgLN6HgmqAUtb0jlrvVIO0RsXc05CMRc/GIFlaYrXrBDakl0qproYbo?=
 =?us-ascii?Q?/5yJVA4F+yfZUItyJL1EFhyRxH6vD0AY5xE2Pgh65wWxukLzfUyo1Ns0fAZG?=
 =?us-ascii?Q?lQdfAj3s7SfcYM3PpEsQPtdt9sbq4VAffsyVo4eRc4IG7U38yqEDh/GRGUfm?=
 =?us-ascii?Q?LMjDARDHLy6bg0lcssqIwn/bvpNnTnNKg1RgI9PsTOPrW/sI5vKzjKTkqWdT?=
 =?us-ascii?Q?kOvsEsA5NOxYgXZUacZ4C5b+LtIGbFUTw4TSu2Xjd8WGzcF3gfT0340lFeRQ?=
 =?us-ascii?Q?XzZpBgi/ZuWWnhIsKNK3NliL6o0S3nMtjz8FNQbyeGNomI3DMRuhmNFEthZh?=
 =?us-ascii?Q?AIhuts97XWnRKtfnMwlMYr+dh+JVTKMb8DcS8OI8ynH1/4XP8tEqVJCKCtQQ?=
 =?us-ascii?Q?NbzeEI1b5f8rkAVDmjOD+7vAmrQ9pTsFkZYMR3EiWFygEz6d70kEPockSYcr?=
 =?us-ascii?Q?6xWORegf0A3XPjCo+A234jCpPr17eQt4qWYk/ylMhO1SFFyEl9w7rge0gL5f?=
 =?us-ascii?Q?7oTzRY4xccwiVvskmQ1WDCwLOFbhwPyhX9Gyoe0GGUo1hI1lYLl5rgTH10ku?=
 =?us-ascii?Q?R877po71bCVpoX7YSeWA2wOAhjfq9ik9NQjI/hxCfF4LZNWBQqW20S8W1V/T?=
 =?us-ascii?Q?4fmoGeddpi2ci++fjJIAFHuW8cVyFMFgCUpa4kTuxkA+T+XgDwu8wesX1Ubi?=
 =?us-ascii?Q?RVTEKZPuIMcgUAkk2+G4ZLQGUkbuigXpuTpQSM3lfQZel1UNkeETeTG7TRK/?=
 =?us-ascii?Q?zX6kNsf90jI6RJYPzUinEVK31/EPfCY+Scd2nIxSE7yhNd9A6C0yWhlLR/G+?=
 =?us-ascii?Q?sA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59374831-b300-4440-8369-08dba7b9a345
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2023 11:26:35.2714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FIj2oCIjRFltApXSIqscnC8LXuz41XXhcdqG67nLhNYNAQbJ3Etc52erTwLbbmMwi7PrUX1Glh0k5k5knOJWDc2p/Ny4LL/bOkZGpsAPC0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5490
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Andy Shevchenko,

Thanks for the feedback.

> Subject: Re: [PATCH] regulator: sy8824x: Make similar OF and ID table
>=20
> On Sat, Aug 26, 2023 at 06:11:58PM +0100, Biju Das wrote:
> > Make similar OF and ID table to extend support for ID match using
> > i2c_match_data(). Currently it works only for OF match tables as the
> > driver_data is wrong for ID match.
>=20
> ...
>=20
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(of, sy8824_dt_ids);
>=20
> ...
>=20
> >  static const struct i2c_device_id sy8824_id[] =3D {
> > -	{ "sy8824", },
> > +	{ "sy8824", (kernel_ulong_t)&sy8824c_cfg },
>=20
> >  	{ },
>=20
> Here is even inconsistency with usage of trailing comma in the terminator
> entry.

OK, it is carry over from original code. Will fix it in v2.

Cheers,
Biju
