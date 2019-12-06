Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3631115595
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2019 17:38:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbfLFQiK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Dec 2019 11:38:10 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46426 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726258AbfLFQiJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Dec 2019 11:38:09 -0500
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2D26B2E5;
        Fri,  6 Dec 2019 17:38:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575650287;
        bh=qIpOSdpC88Kcbo4Bdvo+rznYsUo/yGTnqmh6/XLulaA=;
        h=Reply-To:To:From:Subject:Date:From;
        b=p/GJxM66dcyhmAzcpuBgYcUTEKrPLKsTzgVzac2C7kZ1Fh48HkX7rGl/fPiCHMcKi
         S05GcruZvVWaxqiOxw3mY7Ju8RfdF18Q/0aw++A/58X2OOiGGEIFHb+uYZ7mX4mHmX
         FQXchKCosSfCoewMfwewkB+k3pxfwnRiT+isGAXE=
Reply-To: kieran.bingham@ideasonboard.com
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Regulator probe on demand (or circular dependencies)
Openpgp: preference=signencrypt
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <23236201-a387-7257-35a4-ee4ed2f6bfd0@ideasonboard.com>
Date:   Fri, 6 Dec 2019 16:38:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Mark, Liam, (and other Renesas multimedia-devs)...

I have an issue with a circular dependency on regulators and I'm
wondering if you could offer some guidance before I go down a rabbit hole.

Descriptions first, and a couple of questions down at the bottom:

I have a GMSL deserializer (MAX9286) [0] which connects 4 cameras over a
GMSL bus. These are currently expressed as an I2C Mux (each GMSL
connector provides a channel to communicate over I2C).

The MAX9286 also exposes 2 GPIO pins, as such I have configured the
MAX9286 driver [1] to expose a gpio-chip [2].


Before we communicate with the cameras, we must make sure that they are
powered up, which we do by specifying a 'poc' (power-over-coax)
regulator, and we enable it accordingly.

This works fine when the regulator is not directly tied to the max9286.
But alas we've got a board (the eagle-v3m) which uses the gpio-line on
the max9286 to enable power to the cameras.


You'll hopefully be able to see in patch [2], that the gpio-chip is
created before the call to get the regulator:

  ret = max9286_gpio(priv);
	if (ret)
		return ret;

  priv->regulator = regulator_get(&client->dev, "poc");


And thus at that point the GPIO chip 'exists'.

I have updated the DT for our 'eagle' board to create a regulator-fixed
[3], connected to the GPIO line on the max9286, including the required
delays we must wait for the cameras to come up.

Alas, here-in is where we have our circular dependency. The
regulator-fixed device can not be probed until the GPIO controller is
created during the max9286_probe(). And now I can't get the regulator,
because of course it doesn't yet exist.

I can not return -EPROBE_DEFER from max9286, as that would destroy the
gpio_chip already created, and thus the regulator-fixed would still not
be able to probe anyway, (and also there is a further issue in V4L2
which prevents us from probe-deferring this driver).


So - my diving into the code shows that the regulator_dev_lookup() at
drivers/regulator/core.c tries to identify the regulator from the
of_node (r = of_find_regulator_by_node(node);) but this returns empty
and thus returns -EPROBE_DEFER as highlighted by the comment :

"We have a node, but there is no device. assume it has not registered yet."


[0]
https://www.maximintegrated.com/en/products/interface/high-speed-signaling/MAX9286.html

[1] media: i2c: Add MAX9286 driver
 https://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git/commit/?id=210913146496a0b7661a7b1af03fa8596ef42303

[2] media: i2c: max9286: Add GPIO chip controller
 https://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git/commit/?id=896d77990562068d46749867b5c73b5e62815d47

[3] dts: eagle: Create a regulator-gpio
 https://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git/commit/?id=3b49a32cfc83918eba2dd6936bd9bce03e7cb367
  (That commit title should really read "create a regulator-fixed")



So - after that long description, my questions are -

 - is there anything I can do here within regulator_dev_lookup() to
   attempt creating the regulator_dev 'on-demand' when
   of_find_regulator_by_node(node) returns empty? (or is that crazy, and
   just a rabbit-hole?)

   [2] Ensures that the gpio_chip that it is connected to has already
   been created. (and if it had not we certainly couldn't do anything
   else except a -EPROBE_DEFER)

 - My current workaround is to use a gpio-hog, but that doesn't allow me
   to provide a startup-delay-us which we require, thus I've had to hard
   code a *large* delay into the driver for testing.
   Is there anything 'else' I could do to construct this appropriately
   and define the required delay (which is camera specific) in DT?
   I'd rather not code some table of camera specific delays into the
   max9286 driver...


Note that we can't make any assumptions within the max9286 driver to
always use the gpio-line to enable the cameras. It's just a generic
line, which hardware designers can 'choose' to utilise. Indeed on
another board we have, the 'PoC' regulator is connected to an entirely
separate GPIO (not on the max9286), and thus we don't have this issue.


I sort of hope it might be possible to 'probe' the regulator when it is
needed rather than having to defer, but I fear how that would tie into
the driver core, so this e-mail is really to collect my thoughts on the
current issue before I jump into what could be a horrible dead-end, and
see if anyone has any ideas or comments on this topic.

Thanks for reading this far! And I look forward to any comments...
-- 
Regards
--
Kieran
