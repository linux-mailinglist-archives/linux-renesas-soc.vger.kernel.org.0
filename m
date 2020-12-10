Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50CFD2D5F07
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 16:08:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389985AbgLJPHj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 10:07:39 -0500
Received: from mail.iot.bzh ([51.75.236.24]:62010 "EHLO mail.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388784AbgLJPEs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 10:04:48 -0500
Received: from [192.168.1.26] (lfbn-ren-1-2120-93.w92-167.abo.wanadoo.fr [92.167.199.93])
        by mail.iot.bzh (Postfix) with ESMTPSA id 4FAE140098;
        Thu, 10 Dec 2020 16:03:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; s=20180822;
        t=1607612638; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8kTFjOjwQ3NVF/D4JED5jVChYQ6McGoOhNYBQ2LZMVg=;
        b=KAofPOcqD8zjF9lPjxakTNvCMNpWLDu201tNqxBBOmvSB8rTkgwuH/ma8ARzl1pnDYcxGj
        UA4f4mF4+Y9ofSmgUVIPkgk4pevMpknN8NMw4STdeXaayZRzJxO7/2GGahNZIjLFrW0wN5
        CYma4G1q0vPsViStPki6toOL5hI1HzeLFdjNpyrGlik0KqqxSU/4Y9gLwq4DPdYEy6DwWH
        NBT2S2etKcMBelAmuN9hGi8qzH3qsrv2RllRUa3fn9npQInrvbxJUEi8WVVdKRjXRuEJaF
        aEmIJkQUmSThn7mmntLHY5794QBbyMqgNBUAaq3WCW3/0srYHsMHlNOu10j29w==
Subject: Re: [PATCH 0/5] clk: renesas: Add MFIS clock
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
References: <20201210142021.163182-1-julien.massot@iot.bzh>
 <TYBPR01MB53098A6476F176914F71239886CB0@TYBPR01MB5309.jpnprd01.prod.outlook.com>
From:   Julien Massot <julien.massot@iot.bzh>
Message-ID: <5526f9b5-59b2-492b-f541-8381894a005f@iot.bzh>
Date:   Thu, 10 Dec 2020 16:03:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <TYBPR01MB53098A6476F176914F71239886CB0@TYBPR01MB5309.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On 12/10/20 3:57 PM, Biju Das wrote:
> Hi Julian,
> 
> Thanks for the patch.
> 
>> Subject: [PATCH 0/5] clk: renesas: Add MFIS clock
>>
>> This series adds the missing MFIS clocks for most Reneas R-Car Gen3 SoCs.
>> I have tested this series on E3, M3, and H3 based boards, I don't have
>> access to D3 nor V3 boards.
> 
> Just a question, Can you explain what test have you done with MFIS module?
A basic usage I did is to store and read a byte into one of the 
communication register MFISARIICR / MFISAREMBR, a more complex usage is 
to trigger interrupts between Linux and the realtime processor, using a 
mailbox driver, that I didn't post yet.

Regards,
-- 
Julien Massot [IoT.bzh]
