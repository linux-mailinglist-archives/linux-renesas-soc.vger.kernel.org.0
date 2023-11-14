Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40EE57EBA4B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Nov 2023 00:48:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230400AbjKNXsu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Nov 2023 18:48:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbjKNXst (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Nov 2023 18:48:49 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2116.outbound.protection.outlook.com [40.107.113.116])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30DACD6;
        Tue, 14 Nov 2023 15:48:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hz7r/cxK6akiYPd+NynHRzfCYszNnWxJllMQLX3QLe8XjQmgLQg6ucipIz5ntWpYlzJHkzkSdY19dTq5CZgiCS4CfzTpANvoxX9p7TzwfHGm8Jas2U4GIwa4BNSNPoCRiL5+odxP0EEd3B5u1PSgKmobWdOzzwCOKolVoJv8xWR3JubOZSjbU+xvhMCiOUEel+e1mM3ojPQOkjNTNgb00T3zv+0roOHlF9HGFkGRd5HWYIS/yJd8nygiA+MufIoU2fckdS39aABbcNCjjOyeLwkk3xjc++8wWRPcqiCzEKMZhLtVYTgI/2GHi930VLQMqJ+bnqdgqYRyx4xXTqfw2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTRdrRqVlzNtSLvlZz5+LPl2I1Bv/kJW6KN+IjMJ2Rk=;
 b=jQqXcne7OmB8W7JfaHjfn3D73exBMyK2L8GK1+jwAEly/sO7hysv7NVnETE/Fb1XPAKlhWd//QMFvzsI+s2gEWl6DYcV3QkK0mmgHZQiJAhiGDXLUj+UkkPO2m7qTgc39pHKB/Flo1PxcCxUsHkxjIkdGGaLv7+Cj621ZjYReL57zICDo4L5h7c2Jcy5EC+JjKbnW1iBY7hQv2qZrwXkb3Nlr2uxh1+w8W3h/eHpmm/me6AB022GE/w/V1/yR4pXJOd7RPYbyyHLLvHasuxOIKbz+2HDRtimtuwApp7VJLYxC40GboD5GNa29TIPhksXKeXEXgf9Hra6xX1nzdBNmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTRdrRqVlzNtSLvlZz5+LPl2I1Bv/kJW6KN+IjMJ2Rk=;
 b=DkrFA9AAFD5fE6DXXACdckKS6LQOVAmquXBuP1cz8YX80z3kjIig/zhYjwpMmzTSrdWG+4oxjJu0uUEmI+T7r2KiWGaraxu2+VTgYRJRa+DcTMBJ78aaYBQJaFKltwSz+FCvCNnkxaDGkBXYEZsi3MnaJ/Xudp1QvwbCZ5SNhN4=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TY3PR01MB11690.jpnprd01.prod.outlook.com
 (2603:1096:400:3dd::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18; Tue, 14 Nov
 2023 23:48:43 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7%7]) with mapi id 15.20.7002.018; Tue, 14 Nov 2023
 23:48:43 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Jakub Kicinski <kuba@kernel.org>
CC:     "s.shtylyov@omp.ru" <s.shtylyov@omp.ru>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net v2] ravb: Fix races between ravb_tx_timeout_work() and
 net related ops
Thread-Topic: [PATCH net v2] ravb: Fix races between ravb_tx_timeout_work()
 and net related ops
Thread-Index: AQHaAoALb6SIWPIxUEiZAXqbN+NjubB5qghAgADfkQCAABtP8A==
Date:   Tue, 14 Nov 2023 23:48:43 +0000
Message-ID: <TYBPR01MB5341769D1052C7379510A6C1D8B2A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20231019113308.1133944-1-yoshihiro.shimoda.uh@renesas.com>
        <TYBPR01MB534172F049F8072E3F77AC25D8B2A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <20231114170956.7bddff5b@kernel.org>
In-Reply-To: <20231114170956.7bddff5b@kernel.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TY3PR01MB11690:EE_
x-ms-office365-filtering-correlation-id: 9efd2e2b-85b3-49d3-6fb1-08dbe56c3c3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k9DN5QfjMFwVDpaLM7lfQpXxhKLusnCRQ1ktu3d2ns3RQHzqo3TEolqC8cC8ZRAuQjw9zmy/VZ841XxulCk6q0antG4m/R4fylOdq1Yn198kum52ExVyxX+XDLWc4woXdk+lVGcTE1vOC2nbkAAe4MLLxF5SsuDYv7sPQkjx14hCm+4kqQSZv2NNpanYdcFARgpQy5nJn/Vle/5jVQBD6+9Qk3iSPpADgf8hVO0z0J1LA/2zvMNwWH1a9U2QhvZrNIFsn0coHFK+hR+BzCa9iwgbI9q2MlB3iyr+Agq4RoNsJ5/QDifSNTyyVLlWUoXpPoCevIBVOg6JYLaJJAi1TdWRjBIPiBpt230wEjbwB+RC1hKCva0gU3OawG0JTfSMdSYZBW7XAYm14vIexWj3nqwN6wyshWd4cJOj7QR/Wxu38M2qocT7hXB0lMZJKz8hqXL72qYWf4liJjfuU7ovPDqvmwWTsU3737YwwHrVTnfge2Psd5a757ihgHSu8YEobYciZ1MpYmI2NygKz+8FBlxJYF4P8KELiPw8yi5iPV+oszbpkRa7gJv3Ek0cQdg/+uD7EFVZDlegPnVzz6v83vOCmHCP7UovsL/rrlBxiq5VMZFVgNU3vXFuMCaUDI1W
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(346002)(136003)(39860400002)(396003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(38070700009)(71200400001)(38100700002)(122000001)(7696005)(6506007)(41300700001)(9686003)(83380400001)(52536014)(8676002)(8936002)(4326008)(4744005)(2906002)(86362001)(316002)(5660300002)(66946007)(66556008)(66476007)(66446008)(64756008)(54906003)(76116006)(6916009)(55016003)(33656002)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?t1bLNnYep64G3wH9yy3ZHSBNRGTogfuBCEJZ4OW/jtB3C+s82iPYyg2+ut9N?=
 =?us-ascii?Q?H1o1TmEqcUO9dY4GbYHwnz78ZJ0NeNU5G67A+jTxxlj+qixpXr2MLv9Iz4xo?=
 =?us-ascii?Q?zHYTFbTIsAmIi+60fYCoNMQy1DF2BEA62CuSf1nKNQ2vjRqW7CyIf5XpgvTV?=
 =?us-ascii?Q?dOsDDwOTTH7Dh4e4KXzvV7XMD220sxkUmH9WiqtSQxCykulBvxJGhW3omxnb?=
 =?us-ascii?Q?bSgyPfwdxn5NuImNUPbpC7mMrJgDcGKmYMDPs7GJk5PDvDWlYFHjTlCXsb6M?=
 =?us-ascii?Q?VvE1bhtBlTm+ztMLJaJlrp/JvsUFh04ryE509cp03HpybkATLiWNhmGf1jaS?=
 =?us-ascii?Q?SRNl3XxUvWwk901PY7ZwFob0f/F37/Fj6a4B8D1n9KJYWlTuNjm+zvFWcpdE?=
 =?us-ascii?Q?2yI8kYwHp/k6keUSIB65LrtjbXRxjl8Wyae7FUmiOvw2K4bhs3Z6k/OmOHcy?=
 =?us-ascii?Q?ehTMd0SYsGzplD7iSjcGtXxXkhS+K/4ijwOqjBMlumDq3Y1lXyY1mgG3XrQo?=
 =?us-ascii?Q?i7qjTjzMzGCYD+UJMtbZgodW3r/QMQd4re5EF56W1Gpd6vY+2x2EA0U9GZBU?=
 =?us-ascii?Q?lEMWUXBqWGFy9HD3nfdGUatz1+aIxc+qzdOEPDM84wQLs3bEaO+eXpvnY1Ki?=
 =?us-ascii?Q?cJG4XmdksJNpn4G35W1rEjWRkyYe9+2kCh5ARVWsgwiyD1OHmoV+JS8/Lgtd?=
 =?us-ascii?Q?Fza9J3bAikgj0bzKSoERBrFKqo2SMaINkrH08G64uyzZZSN3qK+/fzOdKodq?=
 =?us-ascii?Q?Vga+4B/dfSyyU01gPyiAxDSATVQ4lwW2NnDopfKBJUaq7is1vq7J7nfaZsoV?=
 =?us-ascii?Q?HBJVZClMI/QULK06ZCeDwtL8A5iX9QaB7cnewpy4AcYC8nxEDQZISnw8TQp2?=
 =?us-ascii?Q?ixTUaQw/FS5h0F7JrwWuol9WGNJa70ZaPUSsOjX0+NFr06p+VmTHy6N/mVi+?=
 =?us-ascii?Q?jUFlUTkeBC8sSltKFq92lVlQuii9+af2MfS5h48qf9D700WJERdcsabWCsxA?=
 =?us-ascii?Q?j+CuoZKP6cScVTLsQ0QZ0UJLxCYX0Gh8BU7rBMMAESTlFgcZz4Y97RbOHHH6?=
 =?us-ascii?Q?4i8wWzNQoJmhR0ydGkshsFnsL9MDvxjGeC1LNp7JNdfAmDXdsRrFJVEQH8XE?=
 =?us-ascii?Q?totxewpxlz2Ub5/j9esa5sdEN3uMQXcubTf+smWwI9I+M2GbNBp9Nmdr4xK6?=
 =?us-ascii?Q?px052m/4+q4TmBs/RQ8J/NaaflcaaEwl6EM8seBJDkiFE3enmbzsdQ6UyzGr?=
 =?us-ascii?Q?ohvfGuSE+gCyvGc/lAofR0rZwfcYOjHRUtgDDlSsFwXXvo/wTI8YWNk3uPbi?=
 =?us-ascii?Q?BV7fh9U+jdLarPxDO+ljP+qvLa9A0mmMpkHDvnsOmZakAvUVAh+7eDI1Pwmd?=
 =?us-ascii?Q?DAYzq9FrSeBoOogXcm2nyPtxnzOQpbEQCWf+WQJD3denR6hZUunx3kS46SJZ?=
 =?us-ascii?Q?NDp6Ev8ly7bLMe5N5Gc98QceX+n7D8QKIP6iOMWjHBto7/H5phLF2wf9+15w?=
 =?us-ascii?Q?nLizmIqBtROopNQ95DDZw1bJ/1It7SfQjaSrP0cYuMRBhva3/hoEc6DyF/mx?=
 =?us-ascii?Q?TggY3SOpcEuXWK0QssOZSHqdun/Rm7UWOf8ef81JybF1umdMdVg8+/Xkhjnk?=
 =?us-ascii?Q?TkFXQOXoirTH4vrHTL0Ij+W1D9V+i0LlABSPfePExyNZaR5vhJ4x3YBUv7nC?=
 =?us-ascii?Q?5YNyRQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9efd2e2b-85b3-49d3-6fb1-08dbe56c3c3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2023 23:48:43.2785
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fnpc0REMeoU3q/NAtgmuFx0v3cDfcBZAMkSod+4NwsC8JoODfncLxV+kV9urQ1oayh5crM8SRQwLyO1V/N5g+LtmZwfZbyUN7ju0DIuVKb2Tml4Uapd+P8YsLAPrx3+C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11690
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

> From: Jakub Kicinski, Sent: Wednesday, November 15, 2023 7:10 AM
>=20
> On Tue, 14 Nov 2023 08:52:29 +0000 Yoshihiro Shimoda wrote:
> > Gentle ping. I confirmed that I could apply this patch on
> > the latest net.git / main branch.
>=20
> At a glance the suggestion from Sergei makes sense.
> You need to reply to him.

Thank you for your reply. I completely overlooked his suggestion.
I'll check it and reply to him.

Best regards,
Yoshihiro Shimoda

