Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF21474A65
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2019 11:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbfGYJwJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Jul 2019 05:52:09 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:58896 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbfGYJwJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Jul 2019 05:52:09 -0400
Received: from [10.37.62.160] (unknown [83.137.6.249])
        by kirsty.vergenet.net (Postfix) with ESMTPSA id 40AE925AEC0;
        Thu, 25 Jul 2019 19:52:05 +1000 (AEST)
Date:   Thu, 25 Jul 2019 11:51:59 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <20190725073530.GA1323@kunai>
References: <20190717125739.21450-1-horms+renesas@verge.net.au> <20190717132607.GA1458@kunai> <20190724105203.thykr2staw22gdj3@verge.net.au> <20190724210441.GA1559@kunai> <20190725055721.37mcdtpeer3knrxa@verge.net.au> <20190725073530.GA1323@kunai>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Subject: Re: [PATCH/RFC repost] arm64: dts: renesas: ebisu, draak: Limit EtherAVB to 100Mbps
To:     Wolfram Sang <wsa@the-dreams.de>, Simon Horman <horms@verge.net.au>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>
From:   Simon Horman <simon@horms.net>
Message-ID: <D8A18074-5398-4EA0-B11B-93E116317980@horms.net>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



On 25 July 2019 09:35:30 CEST, Wolfram Sang <wsa@the-dreams.de> wrote:
>
>> Sure, how about something like this:
>> 
>>                 /* TX clock internal delay mode is required for
>reliable
>>                  * 1Gbps communication using the KSZ9031RNX phy
>present on
>>                  * the Ebisu board, however, TX clock internal delay
>mode
>>                  * isn't supported on r8a77990.  Thus, limit speed to
>>                  * 100Mbps for reliable communication.
>>                  */
>> 		max-speed = <100>;
>
>Yes, I like it. If DTs have kernel coding style, there should be a
>blank
>'/*' at the beginning.

Thanks, I'll fix that.
