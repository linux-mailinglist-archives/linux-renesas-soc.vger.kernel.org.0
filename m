Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2DF8367B12
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Apr 2021 09:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230206AbhDVHaR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Apr 2021 03:30:17 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:42003 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229655AbhDVHaR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Apr 2021 03:30:17 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ZTmLlpai0vTEDZTmOlXxbz; Thu, 22 Apr 2021 09:29:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619076581; bh=oIW+nvV7g8uuFXS5Li+7k1cw1v41jSUACUG+uDWH11I=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Mbewete0KCFnfijnv2trCYBYiZ3rNTJtDA+cLKOGgvPvOOqfvr5SRLEVtbiOfNIY+
         PtiUW27sV7+R6xyQn3SteKjLeQayDSTTMZBwLrlb75tt47ww/OaVofB7rmNzDoGXMb
         +eV5m0NWyFDHBCEOm7A6jh41m8KQgSsm30K4KzQwVSgcFz2AdHOvyftRRoUqUT30uu
         DzAOj7bRuTGg+emjALCzI0Xmw8XMBYplVEsdtEC6i2/WCcW+OssoW4sgW7u2D8CE+g
         LuiOtdU2DA4FiIBjWnR7iorS2swDRCn7Mnvwc3nZkCyJ9DczEz8xOfOcCR3oF5tCim
         6YhP52qnBWvBA==
Subject: Re: [PATCH 073/190] Revert "media: rcar_drif: fix a memory
 disclosure"
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kangjie Lu <kjlu@umn.edu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
References: <20210421130105.1226686-1-gregkh@linuxfoundation.org>
 <20210421130105.1226686-74-gregkh@linuxfoundation.org>
 <CAMuHMdVFf3_jo+oGPm4THhan3bVZx99omkG1LnAp=B4JTKhChA@mail.gmail.com>
 <YICXdauWkNRezHgX@pendragon.ideasonboard.com>
 <CAMuHMdXN_j49MeEv2wUW5JOeYbJYU7Gj1FtEv7s744mo0x1rWA@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <c8dbe373-8910-5b34-ce71-cad1bcab2d71@xs4all.nl>
Date:   Thu, 22 Apr 2021 09:29:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXN_j49MeEv2wUW5JOeYbJYU7Gj1FtEv7s744mo0x1rWA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOukMg71tIcGr++cpAbnyngrNb3arbuVJgPCPNjgT8tTvtTZdAR0IqHgNlmRweQWHjbJsENSJiQwaV+PORNmg4lJakV66J8q0ARdnsvrZ6tDhD6OcpwH
 e8O4RkZD78uneJg8Zc9V7sqCKFJjKRxXBE5J2BWEDqLAuGgmSOzzebZHsxVOCscUHswP8xKJKEGMXeEI1rE/eMTVq3IEx6mlzX0YDAkNyh3Fog4ZxczG0UM4
 jd5E7WZ5YGo7HFtNvlzwmJOo6s9woQWcpxRPS4VLhDfF+/IhWfxm8SS5AE1wxvWWQFIkhUCi7K8TqZdWC/2/hpAzUC/45pg/PUcPT4F9y78pjTSSrfH39CBa
 Cg8BpoCIrDmhpjHfWMyr919l8SvfIvM5hJ0om8UVREZ0KUEgwrwW1OF1dWTDTU7JkxDBAKNx/izepMQg/ISEhFlFBS6eOMuhAwTLmmqQlO0kjUYLuVsw4ltv
 pciFheaBTZwgG///eJwsFX/BqDu4/iZvbYkWCb8YwmBs4vMZ8O+es9Um4gk=
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 22/04/2021 08:57, Geert Uytterhoeven wrote:
> Hi Laurent,
> 
> On Wed, Apr 21, 2021 at 11:22 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>> On Wed, Apr 21, 2021 at 08:58:22PM +0200, Geert Uytterhoeven wrote:
>>> On Wed, Apr 21, 2021 at 3:06 PM Greg Kroah-Hartman wrote:
>>>> This reverts commit d39083234c60519724c6ed59509a2129fd2aed41.
>>>>
>>>> Commits from @umn.edu addresses have been found to be submitted in "bad
>>>> faith" to try to test the kernel community's ability to review "known
>>>> malicious" changes.  The result of these submissions can be found in a
>>>> paper published at the 42nd IEEE Symposium on Security and Privacy
>>>> entitled, "Open Source Insecurity: Stealthily Introducing
>>>> Vulnerabilities via Hypocrite Commits" written by Qiushi Wu (University
>>>> of Minnesota) and Kangjie Lu (University of Minnesota).
>>>>
>>>> Because of this, all submissions from this group must be reverted from
>>>> the kernel tree and will need to be re-reviewed again to determine if
>>>> they actually are a valid fix.  Until that work is complete, remove this
>>>> change to ensure that no problems are being introduced into the
>>>> codebase.
>>>>
>>>> Cc: Kangjie Lu <kjlu@umn.edu>
>>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>>>> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>>>> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>>
>>> Upon a second look, I still see nothing wrong with the original commit.
>>> However, as I'm no v4l expert, I'd like to defer to the experts for final
>>> judgement.
>>
>> It seems fine to me, but it also seems unneeded, as the V4L2 core clears
>> the whole f->fmt union before calling this operation. The revert will
>> this improve performance very slightly.
> 
> Hmm, that means very recent commit f12b81e47f48940a ("media: core
> headers: fix kernel-doc warnings") is not fully correct, as it added
> kerneldoc stating this is the responsibility of the driver:
> 
> + * @reserved:          drivers and applications must zero this array

Actually, it is the V4L2 core used by the driver that zeroes this. So
drivers don't need to do this, it's done for them. It used to be the
responsibility of the driver itself, but this was all moved to the core
framework a long time ago since, duh!, drivers always forgot this :-)

> 
> Anyway, it doesn't look like this umn.edu patch introduced a bug.

I haven't seen any bugs introduced by the media patches from umn.edu.

Regards,

	Hans

> 
>>>> --- a/drivers/media/platform/rcar_drif.c
>>>> +++ b/drivers/media/platform/rcar_drif.c
>>>> @@ -915,7 +915,6 @@ static int rcar_drif_g_fmt_sdr_cap(struct file *file, void *priv,
>>>>  {
>>>>         struct rcar_drif_sdr *sdr = video_drvdata(file);
>>>>
>>>> -       memset(f->fmt.sdr.reserved, 0, sizeof(f->fmt.sdr.reserved));
>>>>         f->fmt.sdr.pixelformat = sdr->fmt->pixelformat;
>>>>         f->fmt.sdr.buffersize = sdr->fmt->buffersize;
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

