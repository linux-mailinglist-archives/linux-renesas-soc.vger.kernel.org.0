Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D710A26D057
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Sep 2020 03:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbgIQBBM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Sep 2020 21:01:12 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60300 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgIQBBK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Sep 2020 21:01:10 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8D05C276;
        Thu, 17 Sep 2020 03:01:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600304464;
        bh=S+09xnVx+kGGHRbfyavUGlLFQiDG9ddnOL6zJBcmxdo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dIBq3o73A7EFh2wRgRXh78JvC4iur6dn8bgTsZGySyLmgkhH5Ch0garGwIsQWyrvV
         78gE+HiE84vW5Vnrl9xSO+0buJwCHqSWQpZCohnNW1Y5Goz11HED+v+q4dwzcBD7bj
         knHBnjUSaoJ9pZqFFuhLQttiYIBF0paVk6p9GmOo=
Date:   Thu, 17 Sep 2020 04:00:34 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [VSP-Tests PATCH 1/3] gen-lut: Update for python3
Message-ID: <20200917010034.GS3853@pendragon.ideasonboard.com>
References: <20200916144302.1483470-1-kieran.bingham@ideasonboard.com>
 <20200916144302.1483470-2-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200916144302.1483470-2-kieran.bingham@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Wed, Sep 16, 2020 at 03:43:00PM +0100, Kieran Bingham wrote:
> Python2 has now gone end-of-life and is discontinued.
> 
> Update the gen-lut utility to use python3 directly, converting xrange
> usages to range, and using bytearray to store the tables and write them
> directly removing the discontinued file object.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  data/frames/gen-lut.py | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/data/frames/gen-lut.py b/data/frames/gen-lut.py
> index 07889b11f4ac..335b9f1613bc 100755
> --- a/data/frames/gen-lut.py
> +++ b/data/frames/gen-lut.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python
> +#!/usr/bin/python3
>  # SPDX-License-Identifier: GPL-2.0-or-later
>  # SPDX-FileCopyrightText: 2016 Renesas Electronics Corporation
>  
> @@ -49,26 +49,26 @@ def clu_value(x, y, z, scale, a, freq, weights):
>  	return (z, y, x, 0)
>  
>  def generate_clu(config):
> -	clu = []
> +	clu = bytearray()
>  
> -	for z in xrange(17):
> -		for y in xrange(17):
> -			for x in xrange(17):
> +	for z in range(17):
> +		for y in range(17):
> +			for x in range(17):
>  				clu.extend(clu_value(x, y, z, **config[1]))
>  
> -	file('clu-%s.bin' % config[0], 'wb').write(''.join([chr(c) for c in clu]))
> +	open('clu-%s.bin' % config[0], 'wb').write(clu)
>  
>  
>  def gamma(vin, gamma, scale):
>  	return int(255 * scale * math.pow(vin / 255., gamma))
>  
>  def generate_lut(config):
> -	lut = []
> -	for i in xrange(256):
> +	lut = bytearray()
> +	for i in range(256):
>  		lut.extend([gamma(i, g, config[1]) for g in config[2:]])
>  		lut.append(0)
>  
> -	file('lut-%s.bin' % config[0], 'wb').write(''.join([chr(c) for c in lut]))
> +	open('lut-%s.bin' % config[0], 'wb').write(lut)
>  
>  
>  def main(argv):

-- 
Regards,

Laurent Pinchart
