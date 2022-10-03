Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A56445F2D0F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Oct 2022 11:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbiJCJYI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Oct 2022 05:24:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiJCJYG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Oct 2022 05:24:06 -0400
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150089.outbound.protection.outlook.com [40.107.15.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C030A31DCA
        for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Oct 2022 02:24:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=DOHBAH4ylBHwKsdsrZ4p7q0ypAz2mNoOYwt1V9tyH1Z/WjxwY1zNCrpwwpsVPFBWopb2+MlryNuFL6ZM8wkK0EkukDQorcWeWkyuFq3etFZrKZ59qftdOEy8wyIK0K1JgYaZhTIt/2o2e7WGcFKf/+AbnkxTXZD3o3X09YdNHyNFm2KeQpkNwedAmrMZnoIMOPLFmuA4oH8gkx/u/4hMLgiSKLJtBmstTBcMcI2AVnQbSHEgmFSIbi3Oq2t+Yyx/2Q6iHiZjpaPwHLwi2lhhS+MlZuu8ymZP5Gjc9kn+TV0PO74B5XMFELs3dUnvpGRjWPG+UZlRGIftW00AL6M2zg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFbSuKyJ+vkGrUKrkzdrgGvo7KLwfgauRBHjcomDaUg=;
 b=bRPhc77VTv5FuwsYocx74VjwIkwfkFJBvAlLssTGciiGAUhE7QQwxFG+zv0ypIqmFWNJtl78jPnrlVHL6codsqqBrqE3txecbBLm9owL2FpyYl3QtMEm5fCC6cPNqh7lN6Kmr2zQxmTqnFFe3+/E5yw0YNi3kAQaQbEhF4tHPXMr0kEBfnZGROAjQCtOy+amIZFsWCN3vWL4ZE8W+9abOO9Vq+jv7V9ljKyj9sNoXoojADfHCFcnQa4KVa2IeQch43SZD5qWhU6LAlRcB2EudQTHdJpKYBSnl02yx9IfA7f1kLzaTnlDzAdxGw1AVeoz+gC9AzLOpdcyoVVWmaGvwA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFbSuKyJ+vkGrUKrkzdrgGvo7KLwfgauRBHjcomDaUg=;
 b=WwcWvtNatGOe6kdDPeWrcRNgygNfxmGOXXxuKP3e7v4VRE1U3wOrv7rAD7L+RsbDRS9JlucZPajnlJJKbQapfLMpQ7p0fIucHEXM4VEnFFk2qflMAzZn63s17uTKk1ERT5WlqgAdOkLmV/8E6IKj5S6B9TcuHa921ZIYV5eSYaA=
Received: from DU2PR04CA0153.eurprd04.prod.outlook.com (2603:10a6:10:2b0::8)
 by GVXPR08MB8211.eurprd08.prod.outlook.com (2603:10a6:150:17::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Mon, 3 Oct
 2022 09:23:57 +0000
Received: from DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b0:cafe::75) by DU2PR04CA0153.outlook.office365.com
 (2603:10a6:10:2b0::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.30 via Frontend
 Transport; Mon, 3 Oct 2022 09:23:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT005.mail.protection.outlook.com (100.127.142.81) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Mon, 3 Oct 2022 09:23:56 +0000
Received: ("Tessian outbound 937eed45f6ed:v128"); Mon, 03 Oct 2022 09:23:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 95d2e9fab833515b
X-CR-MTA-TID: 64aa7808
Received: from 0914d38d10af.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3584CC39-49E2-4C54-86A2-0816EA81A934.1;
        Mon, 03 Oct 2022 09:23:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0914d38d10af.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 03 Oct 2022 09:23:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETii1YylNTP9VhnRpDFX1GOiCw8bQqaJqx6cJfk98mue0sRC7EH+31ggKU7piWZEowqUFtHUC/zIu4VTpiqXndntdoMqCnP68FEJ6MnPcn3UBn3CeZFAbQFp3rlojJxtyNHJXhLR54GOOhdWSovfz/oVzxuPdWf1QT9nSTXNlyT6jprvCLg5ylzfVoFvWtUOLdJSFlihrtV2fvawbCuKOUrxUgbOfPKMo2oCwhssa8yuesovQwRIcIES6KUQAVkYWbwwbPgaU51u9nxwi3WDvarwDIhkLs/PCs4faC4HxtbhVu0BrkgfnRMU3KSNvKzzVeVP0g9EpTodiK1avtPFSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFbSuKyJ+vkGrUKrkzdrgGvo7KLwfgauRBHjcomDaUg=;
 b=WZatIuhFJ2d715fQvS7b0fWQ9S9sc409lL9x8LaXnTavzRl3OTo/g8UbVR3OjeKtXfm3KmY0O9GHyxv3uQi2NGseZW7/+gVvvYqxMuybkm2sPMLRbyS4hkz7MceYJyyusXlZjbInJu75C49zCM5JgJwMhSJL728Zk+s/33Gy1GMaeYvCpbpWcIUarXFcgXUKJ04QOLIMNBw+MIRuvIfujkieLMA75Ojnt+0tSr4fkgJSjCDRMl4GGpn2u7PR6FLhDsNwhezMbI1LAicknvrISxSOneMtV+FzT4pDdzCak7F4t9tb1EKezw8LaTu1gyKYwptgW9EVDGuk305/EeUwKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFbSuKyJ+vkGrUKrkzdrgGvo7KLwfgauRBHjcomDaUg=;
 b=WwcWvtNatGOe6kdDPeWrcRNgygNfxmGOXXxuKP3e7v4VRE1U3wOrv7rAD7L+RsbDRS9JlucZPajnlJJKbQapfLMpQ7p0fIucHEXM4VEnFFk2qflMAzZn63s17uTKk1ERT5WlqgAdOkLmV/8E6IKj5S6B9TcuHa921ZIYV5eSYaA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from HE1PR08MB2827.eurprd08.prod.outlook.com (2603:10a6:7:37::11) by
 GV1PR08MB8106.eurprd08.prod.outlook.com (2603:10a6:150:95::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.28; Mon, 3 Oct 2022 09:23:48 +0000
Received: from HE1PR08MB2827.eurprd08.prod.outlook.com
 ([fe80::d981:e6fd:db8e:b9ca]) by HE1PR08MB2827.eurprd08.prod.outlook.com
 ([fe80::d981:e6fd:db8e:b9ca%7]) with mapi id 15.20.5676.029; Mon, 3 Oct 2022
 09:23:47 +0000
Message-ID: <c0a5e9ce-1c8c-4e71-8856-e0d8b36849c2@arm.com>
Date:   Mon, 3 Oct 2022 11:23:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [TF-A] Re: [PATCH TF-A] fix(plat/rcar3): Fix RPC-IF device node
 name
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     tf-a@lists.trustedfirmware.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <3685623bed84674039adb61e723288d359ab0a50.1648544199.git.geert+renesas@glider.be>
 <CAMuHMdWdrugZEN=7yqrsSc86AeuFR2=qM7nRk_aD=UXW9Q6cLQ@mail.gmail.com>
 <CAMuHMdWiQNjx9_hDhMEe0gHLiqLw1U0Sy0JSb+bdXHEBMgyNvg@mail.gmail.com>
 <CAMuHMdXAdeVXFytY4_ffNUJ6JVVt4SpVyk4wwDx4yMNY4hwG4Q@mail.gmail.com>
 <7b05d61c-3f81-c58d-3728-88a2b4a5201f@arm.com>
 <CAMuHMdWhHMMzaLhko38Twi2Qv81qtkzsuz0T=Jb4PjLqes09TA@mail.gmail.com>
 <CAMuHMdXLtoY4ccMdhkJozHAbtYxJtotfu9+NRtaEF9n7UBznww@mail.gmail.com>
From:   Sandrine Bailleux <sandrine.bailleux@arm.com>
In-Reply-To: <CAMuHMdXLtoY4ccMdhkJozHAbtYxJtotfu9+NRtaEF9n7UBznww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0027.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::14) To HE1PR08MB2827.eurprd08.prod.outlook.com
 (2603:10a6:7:37::11)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: HE1PR08MB2827:EE_|GV1PR08MB8106:EE_|DBAEUR03FT005:EE_|GVXPR08MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: ce27dd15-457b-4421-0d85-08daa520ff59
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: eErhFlo8IvWMfkdP4TCM1GelrNQNFFwwTMWBxZcKgERfU0qGeMjzK9IO+TGIj6DlDNTOhnuNz6yLLy8oc2WA8h8sWrgNOLM+6sjSpSfZLj1nRw9S4K8qIC3vrUJZjQD604uk3cRoTelECIvj7NJzDkSIttnUMozaqe6J3feTOx1HQe/i2XuGuQJ01X2l/CaJL0nYR4U1PS0L0aMJZM9D6eRfIqduRDO9HjZBWyBLJAEHFgXzW0jTgx69UnsZzlZ+0O4MJFMoWDU5EvMcCKWlDnzkL8V9yRVPDhCJ45a5Q3BZ3kqTLqAu5hAdyQ9ybQEfWPzEmNC76V6S4AJZSX8JOAaCXLmM+Jp3PB/+bat8R3Uhete46+PlH8J+c7pz5LLo5gEAtvKafTwX1mLg3X/VpEyF/z3XUxNJPXTnYOh2OvhLp+GmT/IPXNSyfGcZrAh0Q+Jat8O+Na9KIkh6zVNU+Mj++yVCcWNwzypCe0soocVNiX9KPMLMGLgqrA+3FbKLMc7z8GIXopawdbOruDBMzvOFnODT7qPjfl1nAZAUAL05Auo0SIc7rRWgVK9nXby+qnpZSkjEidtp+6bSbFtBpIrK0T6UFENr9gQlzmY4YRKIULUm2c/bGU5H6K7HG0j0aItINhaEpP3MIsShoExop428lNGzRR1YSRZkr98PJQa0fcI1GSHqlAxQu77VC03gXzbmsobqJULDz4S1cJvbwE3xHXX7ya+Rfaxdvil7axrQVLTEBsEYOg4My2BdfhTq3LYflKkQgVQgi5f1Ecnhzkpkr2r+e1CSHK000JZIcZlWvbnfdaHZ2E30AnjZHkR3ghumGgPKGOB9xxoBwbAUXg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR08MB2827.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(376002)(39860400002)(396003)(346002)(451199015)(8936002)(36756003)(5660300002)(2906002)(44832011)(53546011)(26005)(6486002)(316002)(966005)(6506007)(6512007)(478600001)(54906003)(6916009)(86362001)(41300700001)(31696002)(6666004)(186003)(4326008)(66946007)(66556008)(66476007)(2616005)(8676002)(31686004)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8106
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 20dfef27-3755-4512-ffd0-08daa520f960
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9j/5ZWTeloY52okwcW6IXs9di3AcGHz6U7IhMIFShYe8hWF/KP1UODbD2TnxStw7FdxgEWCCRuspn0Gnd4RNIR81tUyxfmvmYrnexAhIri/0OEVwyGUp3qrFyr4dIULJybzMqxqPU9ajP9UEcaRZjjh0Qaqh2CPz0lFWcdk3KDeg5KJLIKxJoW7fjxSVwBPOICg4of/Sa44o7raR7zKuRyo4KTqv9lVlt9ohwFKM++DN+ZUt6LfLmSJdgAz1j708qF0kb9kI0A3m/X94RFvOuJGCgpKpzWgD3s/4EpFJ3ACJoRYrN3Ao1NLuh6dGQ9iXRdggDl9zHEncNDSMz9V7TQ6Fu/CsjXMP03Yp+CloauW2Nf6QmXX/3F1T7+GzJTk1Eeqy7ju/Qpy1m8pUeFzExpY39DbaMfOJdgXugeIxL5mV0ehLmXNhE1re4IZVJ+r8rNxZGpHz3nWBLmPEwIkKDTaSOMaTRQqvcc1hKhyBiah5IEy4MtFpJjhoM9soASsVs/PNnYHUDeORQfGdvV+uRQpA+a+LEX4gpcIGHgoTYGNJ55dBwSW6T2rAPe9A7sHii4VAXEj+GEepT9ll+ybOvkmLdqvVUiFW2n+B74AjHDiBB3mALYPWUeSlJvTY4VCRLC3giyYqTxe60uiElN/Lkvk8t4SAVtYavdn+i8+A036UHICM1mu/vsGyTgRhGXFysoIeszstiTcUjSVbvQz+44VBPjQbKHcruSXXZPbWbUZGcVTVvGwkftuWbIXTqLpV9epjf33uz9T9RvwbLLP4eTysxN8WcsiFzqSiJnHyPWpwLlHZxxuroWlpKcvSwG16sIyLKnA7X993/q0Hgnkimw==
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199015)(40470700004)(46966006)(36840700001)(31686004)(36756003)(82310400005)(40480700001)(44832011)(47076005)(6486002)(6512007)(53546011)(6506007)(966005)(26005)(8936002)(478600001)(6862004)(31696002)(2906002)(70586007)(82740400003)(70206006)(316002)(40460700003)(5660300002)(54906003)(36860700001)(356005)(81166007)(4326008)(6666004)(86362001)(41300700001)(336012)(186003)(2616005)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 09:23:56.7753
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce27dd15-457b-4421-0d85-08daa520ff59
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB8211
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FORGED_SPF_HELO,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,UNPARSEABLE_RELAY
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for the nudge!

I've rebased your patch on top of the integration branch (which has the 
versal_net platform support patches), reran the CI and as I expected, it 
passed.

The patch has been merged now.

Regards,
Sandrine

On 10/3/22 08:58, Geert Uytterhoeven wrote:
> Hi Sandrine,
> 
> On Tue, Sep 20, 2022 at 12:04 PM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> On Thu, Sep 1, 2022 at 9:57 AM Sandrine Bailleux
>> <sandrine.bailleux@arm.com> wrote:
>>> TF-A project uses Gerrit for code reviews. Please refer to the
>>> "Contributor's Guide" [1], in particular section "6.3. Submitting Changes".
>>>
>>> Could you please post your patch to review.trustedfirmware.org, adding
>>> the Renesas platform maintainers as reviewers?
>>
>> Thank you, I have done so.
>> If anything is still missing, please let me know.
> 
> https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/16792
> seems to be stuck because the CI tries to build for the unsupported
> "versal_net" plaform, hence fails.
> 
> What's the next step?
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
