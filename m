Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF4B4CADFD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Mar 2022 19:58:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243207AbiCBS7D (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Mar 2022 13:59:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbiCBS7C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Mar 2022 13:59:02 -0500
Received: from mxout04.lancloud.ru (mxout04.lancloud.ru [45.84.86.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 760A230F4B;
        Wed,  2 Mar 2022 10:58:12 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru DB9F120A6FDB
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH] ata: Drop commas after OF match table sentinels
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>
CC:     Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
        "Patrice Chotard" <patrice.chotard@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-ide@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-renesas-soc@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <15d4b8e1108c902c4e80c87edfc702a7786de4ba.1646209667.git.geert+renesas@glider.be>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <db9de795-dfef-b20b-2b9f-defd9150d7c6@omp.ru>
Date:   Wed, 2 Mar 2022 21:58:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <15d4b8e1108c902c4e80c87edfc702a7786de4ba.1646209667.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 3/2/22 11:30 AM, Geert Uytterhoeven wrote:

> It does not make sense to have a comma after a sentinel, as any new
> elements must be added before the sentinel.
> 
> Add comments to clarify the purpose of the empty elements.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>

[...]

MBR, Sergey
