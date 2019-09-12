Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73C6FB0E7B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Sep 2019 14:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731530AbfILMDR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Sep 2019 08:03:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54488 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730454AbfILMDR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Sep 2019 08:03:17 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0AA6F33A;
        Thu, 12 Sep 2019 14:03:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1568289794;
        bh=C+RrWY0EIzI5LrQTiBgIBlgI6Dg0MAQvhea9e5EBEPE=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Ak6vkLhQupZNcO+qkxcIatxD/iSDy2C70/jLhCsqnseiK4SHFoC45tx6aA3nfx7YR
         U18eXzZ1tde21tv9s5JxH0o/H465yLB8BFO7s1blMXM9gzMoUpzbTCBXn2PGsxjd7O
         2kmPb67OFwvQjG9OSeysvhO6JPAiySXo56x55K4w=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] arm: dts: renesas: r8a77980: Remove r8a77970 DU
 compatible
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20190912103734.1879-1-kieran.bingham+renesas@ideasonboard.com>
 <CAMuHMdWb9qBDZqOs072u_pCRTaGGArAdUBLWbA5kGoU=KM4Y3A@mail.gmail.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <4ecb7e77-45e7-cf91-c8e3-0670d7ae25a7@ideasonboard.com>
Date:   Thu, 12 Sep 2019 13:03:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWb9qBDZqOs072u_pCRTaGGArAdUBLWbA5kGoU=KM4Y3A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 12/09/2019 12:56, Geert Uytterhoeven wrote:
> On Thu, Sep 12, 2019 at 12:38 PM Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
>> The r8a77970 was added with an compatible string for a differnet device
> 
> different

Also s/an/a/ ... Perhaps I should just step away from the keyboard
today, I can't seem to type ! hehe


>> rather than adding the correct compatible to the driver.
>>
>> Remove the unnecessary compatible which is for a different platform.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
>> Please note, this patch should not be integrated until the renesas,du-r8a77980
>> compatible string makes it into the DU [0].
> 
> Hence postponed.


Thanks.
--
KB


> Gr{oetje,eeting}s,
> 
>                         Geert
> 

