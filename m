Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5844B0CD8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Sep 2019 12:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730892AbfILK0m (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Sep 2019 06:26:42 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53842 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730580AbfILK0m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Sep 2019 06:26:42 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E340733A;
        Thu, 12 Sep 2019 12:26:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1568283999;
        bh=2zUt4HB7PYMjMGgMKlMSLXGexV2OpGaqgU1pFFcT7js=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=H2mgjg+P/Ne5IOdvf7iQtkk3RBYP4Bor9aPnpsZzIr+HZP7vBNux9cMFB9cTXgKWQ
         LjZ/LYBoM6sYf52P+BrZn8GagFdig5JfyWL8v4VxXrqv1wjTORNbqmQByNLK4a7Vur
         DrjEJ7TqOuyvTyeAMUwojTQakHp/6LhMECxvuHA4=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] drm: rcar-du: Add r8a77980 support
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20190911192502.16609-1-kieran.bingham+renesas@ideasonboard.com>
 <70b94265-69f3-d18f-1b67-b5b814723b1b@cogentembedded.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <a9cc2193-0a18-0490-c273-c64bd70992f5@ideasonboard.com>
Date:   Thu, 12 Sep 2019 11:26:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <70b94265-69f3-d18f-1b67-b5b814723b1b@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sergei,

(pulling in +Geert for his opinion on compatible string usages)

On 12/09/2019 11:00, Sergei Shtylyov wrote:> Hello!
> 
> On 11.09.2019 22:25, Kieran Bingham wrote:
> 
>> Add direct support for the r8a77980 (V3H).
>>
>> The V3H shares a common, compatible configuration with the r8a77970
>> (V3M) so that device info structure is reused.
> 
>    Do we really need to add yet another compatible in this case?
> I just added r8a77970 to the compatible prop in the r8a77980 DT. That's why
> a patch like this one didn't get posted by me.

It's not just about the compatible string for me here,

There is no indication in the driver that it supports the r8a77980, and
no comment in the driver to explain that the r8a77980 is shared by the
r8a77970.

This patch makes that explicit at the driver.

Also - I am considering sending a patch (that I've already created
anyway) to remove the r8a77970 reference from the

  arch/arm64/boot/dts/renesas/r8a77980.dtsi file.

This is the *only* non r8a77980 reference in this file, so it seems very
out of place.

In fact more so than that - except for a seemingly glaring typo, that
I'll investigate and send a patch for next, this is the *only* cross-soc
compatible reference:



#!/bin/sh

files=r8a77*.dtsi

for f in $files;
do
	soc=`basename $f .dtsi | sed 's/-.*//'`
	echo "F: $f soc: $soc";

	# Find all references to all socs, then hide 'this' soc
	grep r8a77 $f | grep -v $soc
done;

Finds :

> F: r8a774a1.dtsi soc: r8a774a1
> F: r8a774c0.dtsi soc: r8a774c0
> F: r8a7795-es1.dtsi soc: r8a7795
> F: r8a7795.dtsi soc: r8a7795
> F: r8a7796.dtsi soc: r8a7796
> F: r8a77965.dtsi soc: r8a77965
>  * Based on r8a7796.dtsi
> F: r8a77970.dtsi soc: r8a77970
> 			compatible = "renesas,pwm-r8a7790", "renesas,pwm-rcar";
> F: r8a77980.dtsi soc: r8a77980
> 				     "renesas,du-r8a77970";
> F: r8a77990.dtsi soc: r8a77990
> F: r8a77995.dtsi soc: r8a77995

--
KB

> 
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> [...]
> 
> MBR, Sergei

