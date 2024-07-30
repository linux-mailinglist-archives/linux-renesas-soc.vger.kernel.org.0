Return-Path: <linux-renesas-soc+bounces-7622-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 445BC940ED6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 12:19:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D8161C22486
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 10:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71BE4208DA;
	Tue, 30 Jul 2024 10:19:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6C1187878
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2024 10:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722334765; cv=none; b=omCYLJmTFHKdRFBJQ/aAULVPVuRBtXxm4cSSKLu8FEcsvimSgfZIxm2LpA05UbonCn+dOP4CqT9Z1kf9JAzEYPQcDC+++XWX0IjIuXDt0SiTOhPqGwnvATDWnBnAL+Zf50RdjOqJPu5CLnVVUIpGJ5E3kKUMbkS3MjJeMmF1Lx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722334765; c=relaxed/simple;
	bh=5rZldLzBZKTaYenwnBubSp1KM2qU5SHl7r593Su2qMU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JSznrHKEY7vevbLJOidUBl83ZOK0UMMc1r/MrBa5k/3Fm2Wp6EXzcOZM3A5AXYyh6cpe6k6o7WKsK5sOcWFTL4hx1Ts35Zzk/OSvtTFqWiFa6TKmUu6bUCXo5Cn1mTD6KAzj8S9U+q47S31/gTOW/f0CVX7Cm9uuWu8QlV4fMzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4WY9tx2w4Bz4wyBq
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2024 12:09:29 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:520d:93ad:ff6d:335e])
	by albert.telenet-ops.be with bizsmtp
	id tm9N2C00330Ayot06m9Nd4; Tue, 30 Jul 2024 12:09:22 +0200
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sYjnG-0046rp-1R;
	Tue, 30 Jul 2024 12:09:22 +0200
Date: Tue, 30 Jul 2024 12:09:22 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Damien Le Moal <dlemoal@kernel.org>
cc: linux-ide@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
    Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v6 04/11] ata: libata: Print quirks applied to devices
In-Reply-To: <20240726031954.566882-5-dlemoal@kernel.org>
Message-ID: <df29e7c5-778e-ec11-3276-a6c87da2ec2f@linux-m68k.org>
References: <20240726031954.566882-1-dlemoal@kernel.org> <20240726031954.566882-5-dlemoal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

 	Hi Damien,

On Fri, 26 Jul 2024, Damien Le Moal wrote:
> Introduce the function ata_dev_print_quirks() to print the quirk flags
> that will be applied to a scanned device. This new function is called
> from ata_dev_quirks() when a match on a device model or device model
> and revision is found for a device in the __ata_dev_quirks array.
>
> To implement this function, the ATA_QUIRK_ flags are redefined using
> the new enum ata_quirk which defines the bit shift for each quirk
> flag. The array of strings ata_quirk_names is used to define the name
> of each flag, which are printed by ata_dev_print_quirks().
>
> Example output for a device listed in the __ata_dev_quirks array and
> which has the ATA_QUIRK_DISABLE flag applied:
>
> [10193.461270] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
> [10193.469190] ata1.00: Model 'ASMT109x- Config', rev '2143 5', applying quirks: disable
> [10193.469195] ata1.00: unsupported device, disabling
> [10193.481564] ata1.00: disable device
>
> enum ata_quirk also defines the __ATA_QUIRK_MAX value as one plus the
> last quirk flag defined. This value is used in ata_dev_quirks() to add a
> build time check that all quirk flags fit within the unsigned int
> (32-bits) quirks field of struct ata_device.
>
> Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
> Reviewed-by: Igor Pylypiv <ipylypiv@google.com>

Thanks for your patch, which is now commit 58157d607aecb4e0 ("ata:
libata: Print quirks applied to devices") in libata/for-next.

> --- a/drivers/ata/libata-core.c
> +++ b/drivers/ata/libata-core.c
> @@ -4273,15 +4336,18 @@ static unsigned int ata_dev_quirks(const struct ata_device *dev)
> 	unsigned char model_rev[ATA_ID_FW_REV_LEN + 1];
> 	const struct ata_dev_quirks_entry *ad = __ata_dev_quirks;
>
> +	/* dev->quirks is an unsigned int. */
> +	BUILD_BUG_ON(__ATA_QUIRK_MAX > 32);
> +
> 	ata_id_c_string(dev->id, model_num, ATA_ID_PROD, sizeof(model_num));
> 	ata_id_c_string(dev->id, model_rev, ATA_ID_FW_REV, sizeof(model_rev));
>
> 	while (ad->model_num) {
> -		if (glob_match(ad->model_num, model_num)) {
> -			if (ad->model_rev == NULL)
> -				return ad->quirks;
> -			if (glob_match(ad->model_rev, model_rev))
> -				return ad->quirks;
> +		if (glob_match(ad->model_num, model_num) &&
> +		    (!ad->model_rev || glob_match(ad->model_rev, model_rev))) {
> +			ata_dev_print_quirks(dev, model_num, model_rev,
> +					     ad->quirks);
> +			return ad->quirks;
> 		}
> 		ad++;
> 	}

During boot-up on Salvator-XS (using rcar-sata), the quirk info is
printed not once, but four times.  Is that intentional?

     ata1: link resume succeeded after 1 retries
    +rcar-du feb00000.display: [drm] fb0: rcar-dudrmfb frame buffer device
     input: keys as /devices/platform/keys/input/input0
     ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
    +ata1.00: Model 'Maxtor 6L160M0', rev 'BANC1G10', applying quirks: noncq
     ata1.00: ATA-7: Maxtor 6L160M0, BANC1G10, max UDMA/133
     ata1.00: 320173056 sectors, multi 0: LBA48 NCQ (not used)
    +ata1.00: Model 'Maxtor 6L160M0', rev 'BANC1G10', applying quirks: noncq
    +ata1.00: Model 'Maxtor 6L160M0', rev 'BANC1G10', applying quirks: noncq
    +ata1.00: Model 'Maxtor 6L160M0', rev 'BANC1G10', applying quirks: noncq
     ata1.00: configured for UDMA/133
     scsi 0:0:0:0: Direct-Access     ATA      Maxtor 6L160M0   1G10 PQ: 0 ANSI: 5
     sd 0:0:0:0: [sda] 320173056 512-byte logical blocks: (164 GB/153 GiB)
     sd 0:0:0:0: [sda] Write Protect is off
     sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
     sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
     sd 0:0:0:0: [sda] Preferred minimum I/O size 512 bytes
      sda: sda1
     sd 0:0:0:0: [sda] Attached SCSI disk

During resume from s2idle or s2ram, the same info is printed again,
fourfold:

     ata1: link resume succeeded after 1 retries
     ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
    +ata1.00: Model 'Maxtor 6L160M0', rev 'BANC1G10', applying quirks: noncq
    +ata1.00: Model 'Maxtor 6L160M0', rev 'BANC1G10', applying quirks: noncq
    +ata1.00: Model 'Maxtor 6L160M0', rev 'BANC1G10', applying quirks: noncq
    +ata1.00: Model 'Maxtor 6L160M0', rev 'BANC1G10', applying quirks: noncq
     ata1.00: configured for UDMA/133
     ata1.00: Entering active power mode

Thanks!

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds

