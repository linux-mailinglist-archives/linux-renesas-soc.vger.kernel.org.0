Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5004DE1D9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Mar 2022 20:38:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240327AbiCRTju (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Mar 2022 15:39:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235675AbiCRTjs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Mar 2022 15:39:48 -0400
Received: from gateway23.websitewelcome.com (gateway23.websitewelcome.com [192.185.50.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7867210CF36
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Mar 2022 12:38:28 -0700 (PDT)
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
        by gateway23.websitewelcome.com (Postfix) with ESMTP id CFFCC134E5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Mar 2022 14:38:27 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
        by cmsmtp with SMTP
        id VIQdnaHxGRnrrVIQdn1avn; Fri, 18 Mar 2022 14:38:27 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:Subject:From:References:To:MIME-Version:Date:Message-ID:Sender:
        Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=9EFY4Gh8nAEipolVkpX9bo5w5hq/0/xvi1+LZkCH1wI=; b=sioXVMcWwkX47znoMgAg+v1rRE
        l+pcA8xpy+7+AyCFTbN1UkgUG2F9HBDgDHkGQ9+upYve24/T3O0eWxc11t729/8QSmakH4ddrPWt/
        pKr8qvtiI3K304UGbVMlTbDZHsZZKvk56gsNxCVSo0NV3u/GbdrEAfE3xKJsuTShFm3BDe3J/wCcM
        F8RKNwkAvUdi39H59CCJxbzx1+xNWS7UzFoV9ifzW4yKpZyDb9bqVIpLCMVcjeNhtaxeXa74g0+Np
        ErHeo14+hF1553LL28wH8xeE0T5UkJwdHsgjd6wC6QK2ZnNOHIZqmpeMIaqVWZcaWmoI46xsiglQV
        8NUvo2wg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:54328)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@roeck-us.net>)
        id 1nVIQd-002CHc-5v; Fri, 18 Mar 2022 19:38:27 +0000
Message-ID: <af2c8465-6dc0-f0df-48a5-901c922b5dd2@roeck-us.net>
Date:   Fri, 18 Mar 2022 12:38:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To:     Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
        linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be
References: <20220318182625.16182-1-jjhiblot@traphandler.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RESEND PATCH v3 0/2] ARM: r9a06g032: add support for the
 watchdogs
In-Reply-To: <20220318182625.16182-1-jjhiblot@traphandler.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nVIQd-002CHc-5v
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:54328
X-Source-Auth: linux@roeck-us.net
X-Email-Count: 2
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 3/18/22 11:26, Jean-Jacques Hiblot wrote:
> Hi,
> 
> I did not receive any feedback for those 2 patches of the v3 of this
> series, so resending them. The rest of the patches (dt-stuff) have


Well, yes, you didn't send it to linux-watchdog@vger.kernel.org, which
I use as base for reviews, to collect review feedback, and as source
for applying the patches. On top of that, you didn't provide change logs
either, meaning I'd have to dig on the web to find older versions of
your patches (since they won't be in watchdog patchwork either) and
compare those. All that takes a lot of time, and you really should not
expect fast turnaround (if any - your v2 got completely lost for me).

Also, FWIW, after doing just that right now I still disagree that it makes
sense to have a watchdog interrupt do nothing. That is just as good as no
watchdog.

Guenter
