Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A6D073A767
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jun 2023 19:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbjFVRj7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Jun 2023 13:39:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231283AbjFVRjp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Jun 2023 13:39:45 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25DB21FE7;
        Thu, 22 Jun 2023 10:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1687455576; x=1688060376; i=deller@gmx.de;
 bh=wdQcmzKW7tZq4TiRc//wTQ8UA2/uANqRxXM0FsQya2I=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=bKe27awmD2W5HJkynUiPanL2eE7nOklGeHPISBGts0pfwvzX+JKaCm+a6/PyDAcDUwHlYej
 7aLaqUHFaVKPMGFxc0jVItuS+1wO/5V2WehfSplYRPrKDcUdSLAEYFsJsaKeDF7f2dBCjrkMs
 yDPil3btMrRz7Fw2/1OYSpoOpOwHPZrBbXIVCzOKySFfZgN+zRCAAEjJXzzvV/xgKlIEQ0TdI
 sIwpRUEZ6nGYg0AEdQ49V2Qbqu5HSJtW2VCPU2j3FgLOdVm0guRy/lfmOMzBXFpsDwIKgATM5
 i2gTGMsnBOmKxflNM+d/iErjIJcVMbyvWeR4Gxc5lOxVJbcFW4Iw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.155.210]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MN5eX-1qTEB320t3-00J6nA; Thu, 22
 Jun 2023 19:39:36 +0200
Message-ID: <6dc9d84a-002c-820f-59c3-a19b49392c51@gmx.de>
Date:   Thu, 22 Jun 2023 19:39:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] fbdev: sh_mobile_lcdcfb: Fix ARGB32 overlay format typo
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
References: <a48665d08e6d4d2bbbff1d53aab06dfeb19136f4.1687426052.git.geert+renesas@glider.be>
 <20230622151550.GB950@pendragon.ideasonboard.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20230622151550.GB950@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ET461I0in8zA2gBZNZlCFEySoUX5FC0WzwrCrg6q7JUVbRoVZPI
 P9MANu3bR2azX84uHQNaKH7SC7fhMiBZ/8jkAvJbQot9hEuI+hMtcV19eA4qcNuSdYc2WVo
 K1Dgmh54crDZ5EGO0/Urr00dk8yokXqtwQn+uYjObF6hxhgUmLmW+mTm7MlRF0bvrJkxvuT
 /z2hXj4kcffbRECgSznVg==
UI-OutboundReport: notjunk:1;M01:P0:ERM+REMDpD4=;ji9qkw9/Dl7gcVMEG7nKTCUbsOP
 fHT10OYxpvc8VEs5mRjxQ+b7pOGrm3Maw89lPdt8X220F32twKdMtsMTe4u2jVoyp29vXJfc4
 gL7kZFJjxSv6ujmDMWzP6ihCMXlHIO33TgyB63dd5knsDIDpn1t8bC/MSeDsKTo1ltdLx9P8T
 wfi/4u5UiTlFLjTJrxKCVpBMrOEQF4U/fFKda75BXjd+/cGNk/PrXH/i+VZj5eHN9TmwvdTKI
 h5IhxHu2Od+qdTQxFHObUIddjNwELn+PPvY/KiOJNIj9NAIgDGhDUP/jHw/z9js+yZA5MVt+g
 qR0KIFemhDeraWkoTBifwn0sx6R1/UNGOqAEk+Usk9d3zWLfrMxXAC5v4MZVdQtekeylBcrc0
 1kqY54i5DBgE31pZJDAowNE2b2HixTKMWYeIN4J3JsAQ/SjsFrOhU/kS2YijxsJJh4e165ZuP
 VneUI6t5EB5m0MnLBKEZ0ycT+bh8zYR9Q6q60ZlDXkMl0/xvhaqNgFKCFKyrooXVS5KABaKl/
 OA+80E8wAMSrArWBc92dciuRCNNfSsEum6/AwqcCH3cZi+nFDXEmCS3uId0ulY77OpmhNx6BY
 qApCEA8LbJ7067LvLqX2AZWZi+aEYx6QEvrFvPYyD2kr04+XZ+r73jAgVcm0M0l3DE+6Z+Ana
 VAX5aG9i7gFLZa60poeyob6uHgeAWQlpxdVO7SVV7KxdQldVuJ5WOjf3nc/0Cgo/mDL+ghW4N
 QIHwAzaypqPGWPUqtas/XKgYN5IOzW3ICmAsh64/ZBB159DAEG2vBzVVxAq9JhHVCO+oyvnBb
 ykmvr7fJfEOAoRXmpBnxOejob9m4gp7Jjxrbth4iRMPtZjo5aOO4XowchtM0SVydpfCtLdFax
 WkPV6T6d+zRicCWP9WsutRzfq5sTfauQVy0nngN+b/cikpVJlf5ngs/o9Hf1tcf88j8m5TiiP
 Y4wxPLbbte35WduWuu1Nw3j8H/s=
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 6/22/23 17:15, Laurent Pinchart wrote:
> Hi Geert,
>
> Thank you for the patch.
>
> On Thu, Jun 22, 2023 at 11:28:48AM +0200, Geert Uytterhoeven wrote:
>> When configurating a CHn Source Image Format Register (LDBBSIFR), one
>> should use the corresponding LDBBSIFR_RPKF_* definition for overlay
>> planes, not the DDFR_PKF_* definition for the primary plane.
>>
>> Fortunately both definitions resolve to the same value, so this bug did
>> not cause any harm.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com=
>

applied.

Thanks!
Helge

