Return-Path: <linux-renesas-soc+bounces-29672-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGnhGZ/DuWmcNQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29672-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 22:11:59 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AA02B287E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 22:11:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E02F315C7E0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 21:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B275938F243;
	Tue, 17 Mar 2026 21:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PJAbZ52j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8864F346AE8;
	Tue, 17 Mar 2026 21:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773781794; cv=none; b=N1PXU8RXwKrpW9YZj2dUk5m9JrGJSI/Bfw40MAzSq0pnk55hehzUINz9aaLdJaI3nM47oAj8j12nZiWSzO+i+BtYDvxUJ3v31FuVWrCSw3lTjvrYBJafp6u2RwtXoeo6ZsqY4qx8X8PWQWLz1bLIAupuh5RBiG4OPElnm+HVVCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773781794; c=relaxed/simple;
	bh=MnWGC7HeMn0onQGdlxyusL98lBFK6f+bwyuj7KV5zBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cfNgxQlqpTb5AKC4DBLiph6oOwZdDWHqzwrLTAqQ4AqaM7TK8wfzWHjo1mYIkxkcpud+tAiI+aools6jWfYF3Qcss3EhhXJ4YbkThgGHy0eqhlkCZPL6x99NeNt/a7OoQnGQM/MAK+iCeytpOSAsG0Ckv+Rx/JCJawUgRPd/eh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PJAbZ52j; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773781794; x=1805317794;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MnWGC7HeMn0onQGdlxyusL98lBFK6f+bwyuj7KV5zBg=;
  b=PJAbZ52jet52i/7guvv2ZWg4f77JvkYLwAdHc8USAK5IS2ZrR69UZ/uF
   VQR9mw+JCLeTbmoiNUzqL/4EgP9NCsK09e1BmtFfMf7144NB3zf7qjwod
   f4hzQxB+ALHu6FmoY69n/AOiDcZB2q9XaWUhuqrr3l3hudMczo3rHYo+T
   /ttTTrrKi5xwxeMy1Kd5DmWV7kIbaxLgtNmzE5eR2m4ZdlH6UL1Um+89t
   7KeP3ZUo997DVwNncHS3W4WtoRNZrRIbVEWBXHIHU+eNlORZmAV1xYlGj
   JEW/FhoSeAtwYqLebnBCRSdybNzTtiGq5kZfmnWIrDFVvv1JBPrBKgjXt
   A==;
X-CSE-ConnectionGUID: qxDFp6IhREWHgeoLM0NqrA==
X-CSE-MsgGUID: 9KfeBDPrQ6u5Zc39JSltEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74527868"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="74527868"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 14:09:53 -0700
X-CSE-ConnectionGUID: oDXPjczDS/iIXulXJNalJA==
X-CSE-MsgGUID: 26dPCyrGTAOavifEgRFBXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="226535489"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.97])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 14:09:51 -0700
Date: Tue, 17 Mar 2026 23:09:48 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Carsten =?iso-8859-1?Q?Spie=DF?= <mail@carsten-spiess.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v1 1/1] hwmon: (isl28022) Don't check for specific errors
 when parsing properties
Message-ID: <abnDHK_uWcZ_Vdxs@ashevche-desk.local>
References: <20260219140532.2259235-1-andriy.shevchenko@linux.intel.com>
 <CAMuHMdX9CdQNBGegrfHz+-UpuyO-rmHEQ2HUa=JjVpG_0ryacg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX9CdQNBGegrfHz+-UpuyO-rmHEQ2HUa=JjVpG_0ryacg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,carsten-spiess.de,roeck-us.net,glider.be,gmail.com];
	TAGGED_FROM(0.00)[bounces-29672-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,ashevche-desk.local:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 11AA02B287E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Feb 19, 2026 at 03:21:29PM +0100, Geert Uytterhoeven wrote:
> On Thu, 19 Feb 2026 at 15:06, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > Instead of checking for the specific error codes (that can be considered
> > a layering violation to some extent) check for the property existence first
> > and then either parse it, or apply a default value.

> IIRC, we have removed superfluous presence checks all over the tree
> during the past few years? E.g. of_property_read_*() is documented to
> return -EINVAL if a property does not exist.

Implementation detail and actually not accurate.

> So this patch looks like a step back to me...

Not to me, just sent
20260317210828.2117631-1-andriy.shevchenko@linux.intel.com
to clarify in the documentation what's this about.

-- 
With Best Regards,
Andy Shevchenko



