Return-Path: <linux-renesas-soc+bounces-6017-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C3B9027BD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 19:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B642AB23A42
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 17:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50490146D54;
	Mon, 10 Jun 2024 17:25:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA58146A85;
	Mon, 10 Jun 2024 17:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718040336; cv=none; b=bCPZf0B3UGos/lW7wpfQToJ189OCMOkkUoiVcsOwJiugbgjL6CF/2m1LnPuVW34ZH5j930Smkzlh0L3X/2hU/m9NBoogPx9eZAQX3jhUYHnJqWRT9P0BtTJHGkbEoHpbvB32KDiHZrUTWSQiP0bX9Y1iuon0/x1iuFPbBIW3vYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718040336; c=relaxed/simple;
	bh=/XC+mW55r7g3Z7DohPDOOzrNgrg2loXRTnDdHi23zho=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NcMBpMxt/vfmUG8OVa2LmcjePNph6ErwCCSJAohgDSGYWgmmG3cyxKF1onnuY/YsNWBBFw4eJV4+rXDEPi+K31LqL5afq6qWvyFJ+NVJZSjC5diY0Cw2RPwaWOJe+nlufT2wqdQibZ8thDooWGa0xgo/hMGajKZA7Iux5olyZRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf02.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 16FB080F13;
	Mon, 10 Jun 2024 17:25:33 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf02.hostedemail.com (Postfix) with ESMTPA id BA94080012;
	Mon, 10 Jun 2024 17:25:30 +0000 (UTC)
Message-ID: <c4e6c55e3683d72e1688751ac07a242a7e008ab7.camel@perches.com>
Subject: Re: [PATCH v2] checkpatch: really skip LONG_LINE_* when LONG_LINE
 is ignored
From: Joe Perches <joe@perches.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>,  Lukas Bulwahn <lukas.bulwahn@gmail.com>, Andrew
 Morton <akpm@linux-foundation.org>,  linux-kernel@vger.kernel.org
Date: Mon, 10 Jun 2024 10:25:29 -0700
In-Reply-To: <20240610150420.2279-2-wsa+renesas@sang-engineering.com>
References: <20240610150420.2279-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Stat-Signature: drztxps11me4qpxzsrmb7s95j9w4aotf
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: BA94080012
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/3VhGBhzMP6rw5Kfw1qlZD69AsltsBAxU=
X-HE-Tag: 1718040330-163830
X-HE-Meta: U2FsdGVkX1/LMPDsLe0iwAc+RCZSEPnXlqEQhJQ52JeNPyL64hZ+hpR2jtQmMDSvHdRZN8PQ72PZ30tUWULgUnkqjVlut1x4yfQdcjp6yvyW6HGhCQipdSik4KFrxS1LZ22Onk3eNBa26LkcJ0vNrqH5ur2S4B13fEbTl+8Im46IBFXwcUWaeOnGMx0weecUPcD//Btzn+pDITBNowUUxXfefl14mbvb0YFbkDZBq2BMYCmasvI6Hgv0rSWGeQeYR/Uxhj2+6d9/cgYBDK56rVn+m/1eyp8Zt35Ip80ePrDrZ/ZUsLsiNntpcYkyE0TVhaQppzTeSxK4rSmMJ7tL7FBuFxzxd11Edy/bvcn76TAMixwkthBZRippoK3rvsWbP4Oj9XhhoNXHZuwgSbShkUAFKT2yDgXRLqgmvJmLKa+YJOzf/olWV+yvNM7zFO/u

On Mon, 2024-06-10 at 17:02 +0200, Wolfram Sang wrote:
> For a printout to happen, all types must be set to "show". So, AND is nee=
ded
> for the flags, not OR, if we want to ignore something.

Right.  One day I'll learn...

As the comment above the block shows:

47e0c88b37a5c3 (Joe Perches        2015-06-25 15:02:57 -0700 3821) # if LON=
G_LINE is ignored, the other 2 types are also ignored

Acked-by: Joe Perches <joe@perches.com>

>=20
> Fixes: 47e0c88b37a5 ("checkpatch: categorize some long line length checks=
")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> Change since v1:
> * removed now unneeded pair of braces (Thanks, Geert!)
> * reworded commit message
>=20
>  scripts/checkpatch.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 2b812210b412..375749e0a174 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3858,7 +3858,7 @@ sub process {
>  			}
> =20
>  			if ($msg_type ne "" &&
> -			    (show_type("LONG_LINE") || show_type($msg_type))) {
> +			    show_type("LONG_LINE") && show_type($msg_type)) {
>  				my $msg_level =3D \&WARN;
>  				$msg_level =3D \&CHK if ($file);
>  				&{$msg_level}($msg_type,


