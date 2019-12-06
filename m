Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCAA811530A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2019 15:22:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbfLFOWt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Dec 2019 09:22:49 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:43030 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbfLFOWs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Dec 2019 09:22:48 -0500
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3934D2E5;
        Fri,  6 Dec 2019 15:22:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575642166;
        bh=5Oepqjop3IRMR2pVqF2MD34UgyNkHSpoqkfBO6+LHV8=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=XZQYoEkQOArMIcEf4xvhOnzBVuFZTyBfAauT4xNskiO8Yc0RZ/sZxg767WMf/VXp5
         e6FvUpfNm8kGpDEntUF3OZ/OyL/wRfUX3J4pNRuV3mIVOYA3M22RsuYKKubIe94lqk
         Izg8QrxSlsRPAXV/mg0RsUqS48gbQq43lA1QAyXA=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 1/3] media: i2c: max9286: Remove redundant
 max9286_i2c_mux_state
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20191116165034.39001-1-jacopo+renesas@jmondi.org>
 <20191206140520.10457-1-kieran.bingham@ideasonboard.com>
 <CAMuHMdVF6ecH3+9rBN3p3X3rKkP1-kM-4gui8EC3kEx_AWpNFg@mail.gmail.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <32505e5a-8b95-166a-ffa0-15aded842edf@ideasonboard.com>
Date:   Fri, 6 Dec 2019 14:22:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVF6ecH3+9rBN3p3X3rKkP1-kM-4gui8EC3kEx_AWpNFg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 06/12/2019 14:10, Geert Uytterhoeven wrote:
> Hi Kieran,
> 
> On Fri, Dec 6, 2019 at 3:05 PM Kieran Bingham
> <kieran.bingham@ideasonboard.com> wrote:
>> While simplifying the i2c-mux state, the states were stored in an enum
>> (initially there were three).
>>
>> This has now simplified down to 2 states, open and closed - and can be
>> represented easily in a bool.
>>
>> It 'could' also be represented within the mux_channel, but I don't want
>> to pollute that further than the '-1' value which is already stored in
>> there to represent no channel selected.
>>
>> Remove the max9286_i2c_mux_state and replace with a bool mux_open flag,
>> and move the location within the private struct to be more appropriate.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/media/i2c/max9286.c
>> +++ b/drivers/media/i2c/max9286.c
>> @@ -144,10 +144,10 @@ struct max9286_priv {
>>         struct media_pad pads[MAX9286_N_PADS];
>>         struct regulator *regulator;
>>         bool poc_enabled;
>> -       int mux_state;
>>
>>         struct i2c_mux_core *mux;
>>         unsigned int mux_channel;
>> +       bool mux_open;
> 
> Please keep all booleans together, to fill up holes due to alignment
> restrictions.

I was trying to group related i2c_mux items, but I do indeed see a
strong argument there...

/me digs out pahole just to have a look :-D (but I know what the answer is)

struct max9286_priv {
struct i2c_client *        client;               /*     0     8 */
struct gpio_desc *         gpiod_pwdn;           /*     8     8 */
struct v4l2_subdev         sd;                   /*    16   320 */
/* --- cacheline 5 boundary (320 bytes) was 16 bytes ago --- */
struct media_pad           pads[5];              /*   336   280 */
/* --- cacheline 9 boundary (576 bytes) was 40 bytes ago --- */
struct regulator *         regulator;            /*   616     8 */
struct dentry *            dbgroot;              /*   624     8 */
bool                       poc_enabled;          /*   632     1 */

/* XXX 7 bytes hole, try to pack */
/* --- cacheline 10 boundary (640 bytes) --- */

struct gpio_chip           gpio;                 /*   640   600 */
/* --- cacheline 19 boundary (1216 bytes) was 24 bytes ago --- */

u8                         gpio_state;           /*  1240     1 */
/* XXX 7 bytes hole, try to pack */

struct i2c_mux_core *      mux;                  /*  1248     8 /
unsigned int               mux_channel;          /*  1256     4 */
bool                       mux_open;             /*  1260     1 */
/* XXX 3 bytes hole, try to pack */

struct v4l2_ctrl_handler   ctrls;                /*  1264   296 */
/* --- cacheline 24 boundary (1536 bytes) was 24 bytes ago --- */
struct v4l2_mbus_framefmt  fmt[4];               /*  1560   192 */
/* --- cacheline 27 boundary (1728 bytes) was 24 bytes ago --- */
unsigned int               nsources;             /*  1752     4 */
unsigned int               source_mask;          /*  1756     4 */
unsigned int               route_mask;           /*  1760     4 */
unsigned int               csi2_data_lanes;      /*  1764     4 */
struct max9286_source      sources[4];           /*  1768   288 */
/* --- cacheline 32 boundary (2048 bytes) was 8 bytes ago --- */
struct v4l2_async_notifier notifier;             /*  2056    96 */

/* size: 2152, cachelines: 34, members: 20 */
/* sum members: 2135, holes: 3, sum holes: 17 */
/* last cacheline: 40 bytes */
};



Hrm ... this one really pulls me in both directions ...
Which is the lesser evil - memory holes or ungrouped variables?

--
Kieran



> Gr{oetje,eeting}s,
> 
>                         Geert
> 
