Return-Path: <linux-renesas-soc+bounces-5149-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C8F8BC848
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 09:25:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B25C281B9C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 07:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB0DE84FB3;
	Mon,  6 May 2024 07:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SiXZPds8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522A874437;
	Mon,  6 May 2024 07:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714980318; cv=none; b=cqmJCrEVznoyT83/W4bkFNZeG0cyYFNxEppTXTBjmg9RnpZ60MJmIm/mHG9sv9RdqriWqDpEDj/1ACpqEJ6exvSSNUnXqK0n5KGyVEcN4GVPlzHsM8+2qTQ3Yv7DdQdARY+emzkKFWJTX+hUB2fHX7RvlqXmJ3WcbURs3onNvCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714980318; c=relaxed/simple;
	bh=tZldAHobZYZKlhp8ZEuyjiYirCyFlgGG7dOUXTi7y3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITRAM/O2gujHTYTq19aX0khkh+/mES1qrj4gXPoQKkRyCqP7iZ4tkDG2FDCb+lqOuHpWizIsV/8u3OMOySGFTCmlZNUBL92tVzmCtT+fZu57irsFMd68AY2Cm5FpkzHI5EACMevQeosbRPbawdTAz7Pm8eQFst8mbr+pxnrv/Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SiXZPds8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3EFFB836;
	Mon,  6 May 2024 09:25:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714980310;
	bh=tZldAHobZYZKlhp8ZEuyjiYirCyFlgGG7dOUXTi7y3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SiXZPds8jK8D1D2lt8sKY2ChB1gW/BfJbiJJ6pi1ABCl9SjFwYylNFuG5n6Ifbg2f
	 NtBctOGgXPRNap4VUrac/AXA9y3cdRrJ/O33GcYCGpuhdZn67qRiMvwr21pYPCTj49
	 SLPK1N0SGNBkVTWfjJOMijXZRv//QmIvCmGC5CNk=
Date: Mon, 6 May 2024 09:25:08 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 04/11] media: rcar-csi2: Use the subdev active state
Message-ID: <hicrcteav2thufxnlfbukmt23svoomiw6c2p3ngkg55z7e3bo5@l7f5chrf3lsk>
References: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
 <20240503155127.105235-5-jacopo.mondi@ideasonboard.com>
 <20240503180321.GK3927860@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240503180321.GK3927860@ragnatech.se>

Hi Niklas


On Fri, May 03, 2024 at 08:03:21PM GMT, Niklas Söderlund wrote:
> Hi Jacopo,
>
> Thanks for your work.
>
> On 2024-05-03 17:51:19 +0200, Jacopo Mondi wrote:
> > Create the subdevice state with v4l2_subdev_init_finalize() and
> > implement the init_state() operation to guarantee the state is initialized.
>
> This fails and produces -EPIPE error when trying to capture on R-Car M3N
> using ADV748x. If I only apply patch 1, 2, 3 of this series it works as
> expected, when I apply this as well capture breaks.
>
> You can test this on a remote Gen3 board without any HDMI or CVBS
> source, just enable a test patterns on the HDMI and AFE sources, see [1]
> for my test-case output which demonstrates how I produce the failure.
>
> Oddly enough if I use the old vin-test package I can capture from HDMI
> while CVBS capture still fails with -EPIPE. Not sure what's going on.
>
> 1. Ignore the "Unable to get format: Inappropriate ioctl for device
>    (25)." from the "yavta --set-control ..." commands, they are
>    unimportant and not new. Focus in the "Unable to start streaming:
>    Broken pipe (32)." errors from "yavta -c10 --file=..  /dev/videoX"
>    calls, they are not new ;-)
>
> ===> star <===
> Last login: Fri May  3 17:48:06 2024
>
> Renesas Salvator-X 2nd version board based on r8a77965
> 0;root@arm64:~
> arm64 ~ # echo wkbfirytku $$; rm -fr /tmp/vin-capture; echo ygxezpiinz $?
> echo wkbfirytku $$; rm -fr /tmp/vin-capture; echo ygxezpiinz $?

What are these random strings in test logs ? (out of curiosity)

>
> wkbfirytku 403
> ygxezpiinz 0
> echo agyxksooma $$; mkdir -p /tmp/vin-capture; echo kvwostutox $?
> 0;root@arm64:~
> arm64 ~ # echo agyxksooma $$; mkdir -p /tmp/vin-capture; echo kvwostutox $?
>
> agyxksooma 403
> kvwostutox 0
> echo vtmzcdhjtc $$; grep -l 'adv748x 4-0070 afe' /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g'; echo mwqkcmnuju $?
> 0;root@arm64:~
> arm64 ~ # echo vtmzcdhjtc $$; grep -l 'adv748x 4-0070 afe' /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g'; echo mwqkcmnuju $?
>
> vtmzcdhjtc 403
> /dev/v4l-subdev1
> mwqkcmnuju 0
> echo yavkazxvyn $$; grep -l 'VIN0 output' /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g'; echo wpijcgewrd $?
> 0;root@arm64:~
> arm64 ~ # echo yavkazxvyn $$; grep -l 'VIN0 output' /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g'; echo wpijcgewrd $?
>
> yavkazxvyn 403
> /dev/video0
> wpijcgewrd 0
> echo nkitspntrm $$; for mdev in /dev/media*; do if [[ '$(media-ctl -d $mdev -p | grep 'rcar_vin')' != '' ]]; then echo $mdev; break; fi; done; echo ngoqmbhfqr $?
> 0;root@arm64:~
> arm64 ~ # echo nkitspntrm $$; for mdev in /dev/media*; do if [[ '$(media-ctl -d $mdev -p | grep 'rcar_vin')' != '' ]]; then echo $mdev; break; fi; done; echo ngoqmbhfqr $?
>
> nkitspntrm 403
> /dev/media0
> ngoqmbhfqr 0
> echo ggokwokuyh $$; media-ctl -d /dev/media0 -r; echo yydmasvhba $?
> 0;root@arm64:~
> arm64 ~ # echo ggokwokuyh $$; media-ctl -d /dev/media0 -r; echo yydmasvhba $?
>
> ggokwokuyh 403
> yydmasvhba 0
> 0;root@arm64:~
> echo ftqgotsvwt $$; media-ctl -d /dev/media0 -l "'adv748x 4-0070 afe':8 -> 'adv748x 4-0070 txb':0 [1]"; echo ohfyvhjfrt $?
> arm64 ~ # echo ftqgotsvwt $$; media-ctl -d /dev/media0 -l "'adv748x 4-0070 afe':8 -> 'adv748x 4-0070 txb':0 [1]"; echo ohfyvhjfrt $?
>
> ftqgotsvwt 403
> ohfyvhjfrt 0
> 0;root@arm64:~
> echo nhtnyteajn $$; media-ctl -d /dev/media0 -l "'rcar_csi2 fea80000.csi2':1 -> 'VIN0 output':0 [1]"; echo vovincdzqi $?
> arm64 ~ # echo nhtnyteajn $$; media-ctl -d /dev/media0 -l "'rcar_csi2 fea80000.csi2':1 -> 'VIN0 output':0 [1]"; echo vovincdzqi $?
>
> nhtnyteajn 403
> vovincdzqi 0
> 0;root@arm64:~
> echo rulkcoorky $$; media-ctl -d /dev/media0 --get-v4l2 "'adv748x 4-0070 afe':8"; echo esoiygqdfq $?
> arm64 ~ # echo rulkcoorky $$; media-ctl -d /dev/media0 --get-v4l2 "'adv748x 4-0070 afe':8"; echo esoiygqdfq $?
>
> rulkcoorky 403
> 		[stream:0 fmt:UYVY8_2X8/720x240 field:alternate colorspace:smpte170m]
> esoiygqdfq 0
> 0;root@arm64:~
> echo dmdgcctvqh $$; media-ctl -d /dev/media0 -V "'adv748x 4-0070 afe':8 [fmt:UYVY8_2X8/720x240 field:alternate]"; echo ighfsicfux $?
> arm64 ~ # echo dmdgcctvqh $$; media-ctl -d /dev/media0 -V "'adv748x 4-0070 afe':8 [fmt:UYVY8_2X8/720x240 field:alternate]"; echo ighfsicfux $?
>
> dmdgcctvqh 403
> ighfsicfux 0
> 0;root@arm64:~
> echo mqlvxrvync $$; media-ctl -d /dev/media0 -V "'adv748x 4-0070 txb':0 [fmt:UYVY8_2X8/720x240 field:alternate]"; echo elpiosmlzj $?
> arm64 ~ # echo mqlvxrvync $$; media-ctl -d /dev/media0 -V "'adv748x 4-0070 txb':0 [fmt:UYVY8_2X8/720x240 field:alternate]"; echo elpiosmlzj $?
>
> mqlvxrvync 403
> elpiosmlzj 0
> 0;root@arm64:~
> echo aoldaiatak $$; media-ctl -d /dev/media0 -V "'rcar_csi2 fea80000.csi2':1 [fmt:UYVY8_2X8/720x240 field:alternate]"; echo iymsospuex $?
> arm64 ~ # echo aoldaiatak $$; media-ctl -d /dev/media0 -V "'rcar_csi2 fea80000.csi2':1 [fmt:UYVY8_2X8/720x240 field:alternate]"; echo iymsospuex $?

Please read the cover letter

-------------------------------------------------------------------------------
- R-Car CSI-2

There's a user-visible change here, as in the past it was possible to set
format on all pads, and the vin-test scripts do that. In this version I decided
to make the format configurable on the sink and propagate to sources. I'm not
sure if this can be considered a user visible change and we need to maintain
backward compatibility
-------------------------------------------------------------------------------

You should set format on pad #0

How do you feel about that ?


>
> aoldaiatak 403
> iymsospuex 0
> 0;root@arm64:~
> echo nxpbvfvtbv $$; yavta -f RGB565 -s 720x480 --field interlaced /dev/video0; echo dppdatfote $?
> arm64 ~ # echo nxpbvfvtbv $$; yavta -f RGB565 -s 720x480 --field interlaced /dev/video0; echo dppdatfote $?
>
> nxpbvfvtbv 403
> Device /dev/video0 opened.
> Device `R_Car_VIN' on `platform:e6ef0000.video' (driver 'rcar_vin') supports video, capture, without mplanes.
> Video format set: RGB565 (50424752) 720x480 (stride 1440) field interlaced buffer size 691200
> Video format: RGB565 (50424752) 720x480 (stride 1440) field interlaced buffer size 691200
> dppdatfote 0
> echo zsqtrrojrr $$; yavta --set-control '0x009f0903 1' /dev/v4l-subdev1; echo xkrxhzzdcq $?
> 0;root@arm64:~
> arm64 ~ # echo zsqtrrojrr $$; yavta --set-control '0x009f0903 1' /dev/v4l-subdev1; echo xkrxhzzdcq $?
>
> zsqtrrojrr 403
> Device /dev/v4l-subdev1 opened.
> Control 0x009f0903 set to 1, is 1
> Unable to get format: Inappropriate ioctl for device (25).
> xkrxhzzdcq 0
> echo jifvldisax $$; yavta -c10 --file=/tmp/vin-capture/cvbs-solid-#.bin /dev/video0; echo tmzmlnjlsq $?
> 0;root@arm64:~
> arm64 ~ # echo jifvldisax $$; yavta -c10 --file=/tmp/vin-capture/cvbs-solid-#.bin /dev/video0; echo tmzmlnjlsq $?
>
> jifvldisax 403
> Device /dev/video0 opened.
> Device `R_Car_VIN' on `platform:e6ef0000.video' (driver 'rcar_vin') supports video, capture, without mplanes.
> Video format: RGB565 (50424752) 720x480 (stride 1440) field interlaced buffer size 691200
> 8 buffers requested.
> length: 691200 offset: 0 timestamp type/source: mono/EoF
> Buffer 0/0 mapped at address 0xffffb1037000.
> length: 691200 offset: 32768 timestamp type/source: mono/EoF
> Buffer 1/0 mapped at address 0xffffb0f8e000.
> length: 691200 offset: 65536 timestamp type/source: mono/EoF
> Buffer 2/0 mapped at address 0xffffb0ee5000.
> length: 691200 offset: 98304 timestamp type/source: mono/EoF
> Buffer 3/0 mapped at address 0xffffb0e3c000.
> length: 691200 offset: 131072 timestamp type/source: mono/EoF
> Buffer 4/0 mapped at address 0xffffb0d93000.
> length: 691200 offset: 163840 timestamp type/source: mono/EoF
> Buffer 5/0 mapped at address 0xffffb0cea000.
> length: 691200 offset: 196608 timestamp type/source: mono/EoF
> Buffer 6/0 mapped at address 0xffffb0c41000.
> length: 691200 offset: 229376 timestamp type/source: mono/EoF
> Buffer 7/0 mapped at address 0xffffb0b98000.
> Unable to start streaming: Broken pipe (32).
> 8 buffers released.
> tmzmlnjlsq 0
> echo wojwgdpxnx $$; yavta --set-control '0x009f0903 2' /dev/v4l-subdev1; echo dghaavszch $?
> 0;root@arm64:~
> arm64 ~ # echo wojwgdpxnx $$; yavta --set-control '0x009f0903 2' /dev/v4l-subdev1; echo dghaavszch $?
>
> wojwgdpxnx 403
> Device /dev/v4l-subdev1 opened.
> Control 0x009f0903 set to 2, is 2
> Unable to get format: Inappropriate ioctl for device (25).
> dghaavszch 0
> 0;root@arm64:~
> echo tldblgblou $$; yavta -c10 --file=/tmp/vin-capture/cvbs-colorbars-#.bin /dev/video0; echo pofbqvttib $?
> arm64 ~ # echo tldblgblou $$; yavta -c10 --file=/tmp/vin-capture/cvbs-colorbars-#.bin /dev/video0; echo pofbqvttib $?
>
> tldblgblou 403
> Device /dev/video0 opened.
> Device `R_Car_VIN' on `platform:e6ef0000.video' (driver 'rcar_vin') supports video, capture, without mplanes.
> Video format: RGB565 (50424752) 720x480 (stride 1440) field interlaced buffer size 691200
> 8 buffers requested.
> length: 691200 offset: 0 timestamp type/source: mono/EoF
> Buffer 0/0 mapped at address 0xffffb75f7000.
> length: 691200 offset: 32768 timestamp type/source: mono/EoF
> Buffer 1/0 mapped at address 0xffffb754e000.
> length: 691200 offset: 65536 timestamp type/source: mono/EoF
> Buffer 2/0 mapped at address 0xffffb74a5000.
> length: 691200 offset: 98304 timestamp type/source: mono/EoF
> Buffer 3/0 mapped at address 0xffffb73fc000.
> length: 691200 offset: 131072 timestamp type/source: mono/EoF
> Buffer 4/0 mapped at address 0xffffb7353000.
> length: 691200 offset: 163840 timestamp type/source: mono/EoF
> Buffer 5/0 mapped at address 0xffffb72aa000.
> length: 691200 offset: 196608 timestamp type/source: mono/EoF
> Buffer 6/0 mapped at address 0xffffb7201000.
> length: 691200 offset: 229376 timestamp type/source: mono/EoF
> Buffer 7/0 mapped at address 0xffffb7158000.
> Unable to start streaming: Broken pipe (32).
> 8 buffers released.
> pofbqvttib 0
> 0;root@arm64:~
> echo maubyyzesr $$; yavta --set-control '0x009f0903 0' /dev/v4l-subdev1; echo dzbvegabvy $?
> arm64 ~ # echo maubyyzesr $$; yavta --set-control '0x009f0903 0' /dev/v4l-subdev1; echo dzbvegabvy $?
>
> maubyyzesr 403
> Device /dev/v4l-subdev1 opened.
> Control 0x009f0903 set to 0, is 0
> Unable to get format: Inappropriate ioctl for device (25).
> dzbvegabvy 0
> 0;root@arm64:~
> echo pffcsadwlt $$; test -e /tmp/vin-capture/cvbs-solid-000007.bin; echo xilwxnvrrd $?
> arm64 ~ # echo pffcsadwlt $$; test -e /tmp/vin-capture/cvbs-solid-000007.bin; echo xilwxnvrrd $?
>
> pffcsadwlt 403
> xilwxnvrrd 1
> echo grglvpwocj $$; grep -l 'adv748x 4-0070 hdmi' /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g'; echo hvcawnkqdt $?
> 0;root@arm64:~
> arm64 ~ # echo grglvpwocj $$; grep -l 'adv748x 4-0070 hdmi' /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g'; echo hvcawnkqdt $?
>
> grglvpwocj 403
> /dev/v4l-subdev4
> hvcawnkqdt 0
> echo nnpccbuzak $$; media-ctl -d /dev/media0 -r; echo zigvuehatt $?
> 0;root@arm64:~
> arm64 ~ # echo nnpccbuzak $$; media-ctl -d /dev/media0 -r; echo zigvuehatt $?
>
> nnpccbuzak 403
> zigvuehatt 0
> echo xyngygxuyr $$; media-ctl -d /dev/media0 -l "'adv748x 4-0070 hdmi':1 -> 'adv748x 4-0070 txa':0 [1]"; echo oknofsbyvn $?
> 0;root@arm64:~
> arm64 ~ # echo xyngygxuyr $$; media-ctl -d /dev/media0 -l "'adv748x 4-0070 hdmi':1 -> 'adv748x 4-0070 txa':0 [1]"; echo oknofsbyvn $?
>
> xyngygxuyr 403
> oknofsbyvn 0
> 0;root@arm64:~
> echo jkzuanypyp $$; media-ctl -d /dev/media0 -l "'rcar_csi2 feaa0000.csi2':1 -> 'VIN0 output':0 [1]"; echo onsaxggllz $?
> arm64 ~ # echo jkzuanypyp $$; media-ctl -d /dev/media0 -l "'rcar_csi2 feaa0000.csi2':1 -> 'VIN0 output':0 [1]"; echo onsaxggllz $?
>
> jkzuanypyp 403
> onsaxggllz 0
> 0;root@arm64:~
> echo lttzkqwwoa $$; media-ctl -d /dev/media0 --get-v4l2 "'adv748x 4-0070 hdmi':1"; echo imxtuqbxgf $?
> arm64 ~ # echo lttzkqwwoa $$; media-ctl -d /dev/media0 --get-v4l2 "'adv748x 4-0070 hdmi':1"; echo imxtuqbxgf $?
>
> lttzkqwwoa 403
> 		[stream:0 fmt:RGB888_1X24/1280x720 field:none colorspace:srgb]
> imxtuqbxgf 0
> 0;root@arm64:~
> echo degzwngmzk $$; media-ctl -d /dev/media0 -V "'adv748x 4-0070 hdmi':1 [fmt:RGB888_1X24/1280x720 field:none]"; echo vgqpdhbhjt $?
> arm64 ~ # echo degzwngmzk $$; media-ctl -d /dev/media0 -V "'adv748x 4-0070 hdmi':1 [fmt:RGB888_1X24/1280x720 field:none]"; echo vgqpdhbhjt $?
>
> degzwngmzk 403
> vgqpdhbhjt 0
> 0;root@arm64:~
> echo iwtingcfbz $$; media-ctl -d /dev/media0 -V "'adv748x 4-0070 txa':0 [fmt:RGB888_1X24/1280x720 field:none]"; echo qircbjupbq $?
> arm64 ~ # echo iwtingcfbz $$; media-ctl -d /dev/media0 -V "'adv748x 4-0070 txa':0 [fmt:RGB888_1X24/1280x720 field:none]"; echo qircbjupbq $?
>
> iwtingcfbz 403
> qircbjupbq 0
> 0;root@arm64:~
> echo twrjqisqff $$; media-ctl -d /dev/media0 -V "'rcar_csi2 feaa0000.csi2':1 [fmt:RGB888_1X24/1280x720 field:none]"; echo ocaivovrxk $?
> arm64 ~ # echo twrjqisqff $$; media-ctl -d /dev/media0 -V "'rcar_csi2 feaa0000.csi2':1 [fmt:RGB888_1X24/1280x720 field:none]"; echo ocaivovrxk $?
>
> twrjqisqff 403
> ocaivovrxk 0
> echo ajqwydmzik $$; yavta -f RGB565 -s 1280x720 --field none /dev/video0; echo fayawxvllj $?
> 0;root@arm64:~
> arm64 ~ # echo ajqwydmzik $$; yavta -f RGB565 -s 1280x720 --field none /dev/video0; echo fayawxvllj $?
>
> ajqwydmzik 403
> Device /dev/video0 opened.
> Device `R_Car_VIN' on `platform:e6ef0000.video' (driver 'rcar_vin') supports video, capture, without mplanes.
> Video format set: RGB565 (50424752) 1280x720 (stride 2560) field none buffer size 1843200
> Video format: RGB565 (50424752) 1280x720 (stride 2560) field none buffer size 1843200
> fayawxvllj 0
> echo pealtxybun $$; yavta --set-control '0x009f0903 1' /dev/v4l-subdev4; echo juhrczaeao $?
> 0;root@arm64:~
> arm64 ~ # echo pealtxybun $$; yavta --set-control '0x009f0903 1' /dev/v4l-subdev4; echo juhrczaeao $?
>
> pealtxybun 403
> Device /dev/v4l-subdev4 opened.
> Control 0x009f0903 set to 1, is 1
> Unable to get format: Inappropriate ioctl for device (25).
> juhrczaeao 0
> 0;root@arm64:~
> echo oaxoraqdid $$; yavta -c10 --file=/tmp/vin-capture/hdmi-solid-#.bin /dev/video0; echo bfsxvmqitj $?
> arm64 ~ # echo oaxoraqdid $$; yavta -c10 --file=/tmp/vin-capture/hdmi-solid-#.bin /dev/video0; echo bfsxvmqitj $?
>
> oaxoraqdid 403
> Device /dev/video0 opened.
> Device `R_Car_VIN' on `platform:e6ef0000.video' (driver 'rcar_vin') supports video, capture, without mplanes.
> Video format: RGB565 (50424752) 1280x720 (stride 2560) field none buffer size 1843200
> 8 buffers requested.
> length: 1843200 offset: 0 timestamp type/source: mono/EoF
> Buffer 0/0 mapped at address 0xffffafa8e000.
> length: 1843200 offset: 32768 timestamp type/source: mono/EoF
> Buffer 1/0 mapped at address 0xffffaf8cc000.
> length: 1843200 offset: 65536 timestamp type/source: mono/EoF
> Buffer 2/0 mapped at address 0xffffaf70a000.
> length: 1843200 offset: 98304 timestamp type/source: mono/EoF
> Buffer 3/0 mapped at address 0xffffaf548000.
> length: 1843200 offset: 131072 timestamp type/source: mono/EoF
> Buffer 4/0 mapped at address 0xffffaf386000.
> length: 1843200 offset: 163840 timestamp type/source: mono/EoF
> Buffer 5/0 mapped at address 0xffffaf1c4000.
> length: 1843200 offset: 196608 timestamp type/source: mono/EoF
> Buffer 6/0 mapped at address 0xffffaf002000.
> length: 1843200 offset: 229376 timestamp type/source: mono/EoF
> Buffer 7/0 mapped at address 0xffffaee40000.
> Unable to start streaming: Broken pipe (32).
> 8 buffers released.
> bfsxvmqitj 0
> echo pmbwbnrkkw $$; yavta --set-control '0x009f0903 2' /dev/v4l-subdev4; echo ucgivtjwvw $?
> 0;root@arm64:~
> arm64 ~ # echo pmbwbnrkkw $$; yavta --set-control '0x009f0903 2' /dev/v4l-subdev4; echo ucgivtjwvw $?
>
> pmbwbnrkkw 403
> Device /dev/v4l-subdev4 opened.
> Control 0x009f0903 set to 2, is 2
> Unable to get format: Inappropriate ioctl for device (25).
> ucgivtjwvw 0
> 0;root@arm64:~
> echo rvkbtaiuan $$; yavta -c10 --file=/tmp/vin-capture/hdmi-colorbars-#.bin /dev/video0; echo fdlcrvrylc $?
> arm64 ~ # echo rvkbtaiuan $$; yavta -c10 --file=/tmp/vin-capture/hdmi-colorbars-#.bin /dev/video0; echo fdlcrvrylc $?
>
> rvkbtaiuan 403
> Device /dev/video0 opened.
> Device `R_Car_VIN' on `platform:e6ef0000.video' (driver 'rcar_vin') supports video, capture, without mplanes.
> Video format: RGB565 (50424752) 1280x720 (stride 2560) field none buffer size 1843200
> 8 buffers requested.
> length: 1843200 offset: 0 timestamp type/source: mono/EoF
> Buffer 0/0 mapped at address 0xffff86f8e000.
> length: 1843200 offset: 32768 timestamp type/source: mono/EoF
> Buffer 1/0 mapped at address 0xffff86dcc000.
> length: 1843200 offset: 65536 timestamp type/source: mono/EoF
> Buffer 2/0 mapped at address 0xffff86c0a000.
> length: 1843200 offset: 98304 timestamp type/source: mono/EoF
> Buffer 3/0 mapped at address 0xffff86a48000.
> length: 1843200 offset: 131072 timestamp type/source: mono/EoF
> Buffer 4/0 mapped at address 0xffff86886000.
> length: 1843200 offset: 163840 timestamp type/source: mono/EoF
> Buffer 5/0 mapped at address 0xffff866c4000.
> length: 1843200 offset: 196608 timestamp type/source: mono/EoF
> Buffer 6/0 mapped at address 0xffff86502000.
> length: 1843200 offset: 229376 timestamp type/source: mono/EoF
> Buffer 7/0 mapped at address 0xffff86340000.
> Unable to start streaming: Broken pipe (32).
> 8 buffers released.
> fdlcrvrylc 0
> 0;root@arm64:~
> echo hrgnrsupul $$; yavta --set-control '0x009f0903 0' /dev/v4l-subdev4; echo bvgysmcxve $?
> arm64 ~ # echo hrgnrsupul $$; yavta --set-control '0x009f0903 0' /dev/v4l-subdev4; echo bvgysmcxve $?
>
> hrgnrsupul 403
> Device /dev/v4l-subdev4 opened.
> Control 0x009f0903 set to 0, is 0
> Unable to get format: Inappropriate ioctl for device (25).
> bvgysmcxve 0
> echo znlqovrrra $$; test -e /tmp/vin-capture/hdmi-solid-000007.bin; echo sjpcuiptaf $?
> 0;root@arm64:~
> arm64 ~ # echo znlqovrrra $$; test -e /tmp/vin-capture/hdmi-solid-000007.bin; echo sjpcuiptaf $?
>
> znlqovrrra 403
> sjpcuiptaf 1
> exit
> ===> end <===
>
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  drivers/media/platform/renesas/rcar-csi2.c | 138 +++++++++++----------
> >  1 file changed, 75 insertions(+), 63 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> > index 2d464e43a5be..4d4dfb59b025 100644
> > --- a/drivers/media/platform/renesas/rcar-csi2.c
> > +++ b/drivers/media/platform/renesas/rcar-csi2.c
> > @@ -587,7 +587,8 @@ enum rcar_csi2_pads {
> >  struct rcar_csi2_info {
> >  	int (*init_phtw)(struct rcar_csi2 *priv, unsigned int mbps);
> >  	int (*phy_post_init)(struct rcar_csi2 *priv);
> > -	int (*start_receiver)(struct rcar_csi2 *priv);
> > +	int (*start_receiver)(struct rcar_csi2 *priv,
> > +			      struct v4l2_subdev_state *state);
> >  	void (*enter_standby)(struct rcar_csi2 *priv);
> >  	const struct rcsi2_mbps_reg *hsfreqrange;
> >  	unsigned int csi0clkfreqrange;
> > @@ -613,8 +614,6 @@ struct rcar_csi2 {
> >
> >  	int channel_vc[4];
> >
> > -	struct mutex lock; /* Protects mf and stream_count. */
> > -	struct v4l2_mbus_framefmt mf;
> >  	int stream_count;
> >
> >  	bool cphy;
> > @@ -808,20 +807,25 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
> >  	return 0;
> >  }
> >
> > -static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv)
> > +static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
> > +				     struct v4l2_subdev_state *state)
> >  {
> >  	const struct rcar_csi2_format *format;
> >  	u32 phycnt, vcdt = 0, vcdt2 = 0, fld = 0;
> > +	struct v4l2_mbus_framefmt *fmt;
> >  	unsigned int lanes;
> >  	unsigned int i;
> >  	int mbps, ret;
> >
> > +	/* Use the format on the sink pad to compute the receiver config. */
> > +	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> > +
> >  	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
> > -		priv->mf.width, priv->mf.height,
> > -		priv->mf.field == V4L2_FIELD_NONE ? 'p' : 'i');
> > +		fmt->width, fmt->height,
> > +		fmt->field == V4L2_FIELD_NONE ? 'p' : 'i');
> >
> >  	/* Code is validated in set_fmt. */
> > -	format = rcsi2_code_to_fmt(priv->mf.code);
> > +	format = rcsi2_code_to_fmt(fmt->code);
> >  	if (!format)
> >  		return -EINVAL;
> >
> > @@ -849,11 +853,11 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv)
> >  			vcdt2 |= vcdt_part << ((i % 2) * 16);
> >  	}
> >
> > -	if (priv->mf.field == V4L2_FIELD_ALTERNATE) {
> > +	if (fmt->field == V4L2_FIELD_ALTERNATE) {
> >  		fld = FLD_DET_SEL(1) | FLD_FLD_EN4 | FLD_FLD_EN3 | FLD_FLD_EN2
> >  			| FLD_FLD_EN;
> >
> > -		if (priv->mf.height == 240)
> > +		if (fmt->height == 240)
> >  			fld |= FLD_FLD_NUM(0);
> >  		else
> >  			fld |= FLD_FLD_NUM(1);
> > @@ -1049,15 +1053,18 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int msps)
> >  	return 0;
> >  }
> >
> > -static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv)
> > +static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
> > +				    struct v4l2_subdev_state *state)
> >  {
> >  	const struct rcar_csi2_format *format;
> > +	struct v4l2_mbus_framefmt *fmt;
> >  	unsigned int lanes;
> >  	int msps;
> >  	int ret;
> >
> > -	/* Calculate parameters */
> > -	format = rcsi2_code_to_fmt(priv->mf.code);
> > +	/* Use the format on the sink pad to compute the receiver config. */
> > +	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> > +	format = rcsi2_code_to_fmt(fmt->code);
> >  	if (!format)
> >  		return -EINVAL;
> >
> > @@ -1114,7 +1121,7 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv)
> >  	return 0;
> >  }
> >
> > -static int rcsi2_start(struct rcar_csi2 *priv)
> > +static int rcsi2_start(struct rcar_csi2 *priv, struct v4l2_subdev_state *state)
> >  {
> >  	int ret;
> >
> > @@ -1122,7 +1129,7 @@ static int rcsi2_start(struct rcar_csi2 *priv)
> >  	if (ret < 0)
> >  		return ret;
> >
> > -	ret = priv->info->start_receiver(priv);
> > +	ret = priv->info->start_receiver(priv, state);
> >  	if (ret) {
> >  		rcsi2_enter_standby(priv);
> >  		return ret;
> > @@ -1146,17 +1153,16 @@ static void rcsi2_stop(struct rcar_csi2 *priv)
> >  static int rcsi2_s_stream(struct v4l2_subdev *sd, int enable)
> >  {
> >  	struct rcar_csi2 *priv = sd_to_csi2(sd);
> > +	struct v4l2_subdev_state *state;
> >  	int ret = 0;
> >
> > -	mutex_lock(&priv->lock);
> > +	if (!priv->remote)
> > +		return -ENODEV;
> >
> > -	if (!priv->remote) {
> > -		ret = -ENODEV;
> > -		goto out;
> > -	}
> > +	state = v4l2_subdev_lock_and_get_active_state(&priv->subdev);
> >
> >  	if (enable && priv->stream_count == 0) {
> > -		ret = rcsi2_start(priv);
> > +		ret = rcsi2_start(priv, state);
> >  		if (ret)
> >  			goto out;
> >  	} else if (!enable && priv->stream_count == 1) {
> > @@ -1165,49 +1171,26 @@ static int rcsi2_s_stream(struct v4l2_subdev *sd, int enable)
> >
> >  	priv->stream_count += enable ? 1 : -1;
> >  out:
> > -	mutex_unlock(&priv->lock);
> > +	v4l2_subdev_unlock_state(state);
> >
> >  	return ret;
> >  }
> >
> >  static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
> > -				struct v4l2_subdev_state *sd_state,
> > +				struct v4l2_subdev_state *state,
> >  				struct v4l2_subdev_format *format)
> >  {
> > -	struct rcar_csi2 *priv = sd_to_csi2(sd);
> > -	struct v4l2_mbus_framefmt *framefmt;
> > -
> > -	mutex_lock(&priv->lock);
> > +	if (format->pad > RCAR_CSI2_SINK)
> > +		return v4l2_subdev_get_fmt(sd, state, format);
> >
> >  	if (!rcsi2_code_to_fmt(format->format.code))
> >  		format->format.code = rcar_csi2_formats[0].code;
> >
> > -	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > -		priv->mf = format->format;
> > -	} else {
> > -		framefmt = v4l2_subdev_state_get_format(sd_state, 0);
> > -		*framefmt = format->format;
> > -	}
> > -
> > -	mutex_unlock(&priv->lock);
> > -
> > -	return 0;
> > -}
> > -
> > -static int rcsi2_get_pad_format(struct v4l2_subdev *sd,
> > -				struct v4l2_subdev_state *sd_state,
> > -				struct v4l2_subdev_format *format)
> > -{
> > -	struct rcar_csi2 *priv = sd_to_csi2(sd);
> > -
> > -	mutex_lock(&priv->lock);
> > -
> > -	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> > -		format->format = priv->mf;
> > -	else
> > -		format->format = *v4l2_subdev_state_get_format(sd_state, 0);
> > +	*v4l2_subdev_state_get_format(state, format->pad) = format->format;
> >
> > -	mutex_unlock(&priv->lock);
> > +	/* Propagate the format to the source pads. */
> > +	for (unsigned int i = RCAR_CSI2_SOURCE_VC0; i < NR_OF_RCAR_CSI2_PAD; i++)
> > +		*v4l2_subdev_state_get_format(state, i) = format->format;
> >
> >  	return 0;
> >  }
> > @@ -1218,7 +1201,7 @@ static const struct v4l2_subdev_video_ops rcar_csi2_video_ops = {
> >
> >  static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
> >  	.set_fmt = rcsi2_set_pad_format,
> > -	.get_fmt = rcsi2_get_pad_format,
> > +	.get_fmt = v4l2_subdev_get_fmt,
> >  };
> >
> >  static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
> > @@ -1226,6 +1209,30 @@ static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
> >  	.pad	= &rcar_csi2_pad_ops,
> >  };
> >
> > +static int rcsi2_init_state(struct v4l2_subdev *sd,
> > +			    struct v4l2_subdev_state *state)
> > +{
> > +	static const struct v4l2_mbus_framefmt rcar_csi2_default_fmt = {
> > +		.width		= 1920,
> > +		.height		= 1080,
> > +		.code		= MEDIA_BUS_FMT_RGB888_1X24,
> > +		.colorspace	= V4L2_COLORSPACE_SRGB,
> > +		.field		= V4L2_FIELD_NONE,
> > +		.ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT,
> > +		.quantization	= V4L2_QUANTIZATION_DEFAULT,
> > +		.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
> > +	};
> > +
> > +	for (unsigned int i = RCAR_CSI2_SINK; i < NR_OF_RCAR_CSI2_PAD; i++)
> > +		*v4l2_subdev_state_get_format(state, i) = rcar_csi2_default_fmt;
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct v4l2_subdev_internal_ops rcar_csi2_internal_ops = {
> > +	.init_state = rcsi2_init_state,
> > +};
> > +
> >  static irqreturn_t rcsi2_irq(int irq, void *data)
> >  {
> >  	struct rcar_csi2 *priv = data;
> > @@ -1251,14 +1258,17 @@ static irqreturn_t rcsi2_irq(int irq, void *data)
> >
> >  static irqreturn_t rcsi2_irq_thread(int irq, void *data)
> >  {
> > +	struct v4l2_subdev_state *state;
> >  	struct rcar_csi2 *priv = data;
> >
> > -	mutex_lock(&priv->lock);
> > +	state = v4l2_subdev_lock_and_get_active_state(&priv->subdev);
> > +
> >  	rcsi2_stop(priv);
> >  	usleep_range(1000, 2000);
> > -	if (rcsi2_start(priv))
> > +	if (rcsi2_start(priv, state))
> >  		dev_warn(priv->dev, "Failed to restart CSI-2 receiver\n");
> > -	mutex_unlock(&priv->lock);
> > +
> > +	v4l2_subdev_unlock_state(state);
> >
> >  	return IRQ_HANDLED;
> >  }
> > @@ -1870,23 +1880,23 @@ static int rcsi2_probe(struct platform_device *pdev)
> >
> >  	priv->dev = &pdev->dev;
> >
> > -	mutex_init(&priv->lock);
> >  	priv->stream_count = 0;
> >
> >  	ret = rcsi2_probe_resources(priv, pdev);
> >  	if (ret) {
> >  		dev_err(priv->dev, "Failed to get resources\n");
> > -		goto error_mutex;
> > +		return ret;
> >  	}
> >
> >  	platform_set_drvdata(pdev, priv);
> >
> >  	ret = rcsi2_parse_dt(priv);
> >  	if (ret)
> > -		goto error_mutex;
> > +		return ret;
> >
> >  	priv->subdev.owner = THIS_MODULE;
> >  	priv->subdev.dev = &pdev->dev;
> > +	priv->subdev.internal_ops = &rcar_csi2_internal_ops;
> >  	v4l2_subdev_init(&priv->subdev, &rcar_csi2_subdev_ops);
> >  	v4l2_set_subdevdata(&priv->subdev, &pdev->dev);
> >  	snprintf(priv->subdev.name, sizeof(priv->subdev.name), "%s %s",
> > @@ -1912,21 +1922,25 @@ static int rcsi2_probe(struct platform_device *pdev)
> >
> >  	pm_runtime_enable(&pdev->dev);
> >
> > +	ret = v4l2_subdev_init_finalize(&priv->subdev);
> > +	if (ret)
> > +		goto error_pm_runtime;
> > +
> >  	ret = v4l2_async_register_subdev(&priv->subdev);
> >  	if (ret < 0)
> > -		goto error_pm_runtime;
> > +		goto error_subdev;
> >
> >  	dev_info(priv->dev, "%d lanes found\n", priv->lanes);
> >
> >  	return 0;
> >
> > +error_subdev:
> > +	v4l2_subdev_cleanup(&priv->subdev);
> >  error_pm_runtime:
> >  	pm_runtime_disable(&pdev->dev);
> >  error_async:
> >  	v4l2_async_nf_unregister(&priv->notifier);
> >  	v4l2_async_nf_cleanup(&priv->notifier);
> > -error_mutex:
> > -	mutex_destroy(&priv->lock);
> >
> >  	return ret;
> >  }
> > @@ -1941,8 +1955,6 @@ static void rcsi2_remove(struct platform_device *pdev)
> >  	v4l2_subdev_cleanup(&priv->subdev);
> >
> >  	pm_runtime_disable(&pdev->dev);
> > -
> > -	mutex_destroy(&priv->lock);
> >  }
> >
> >  static struct platform_driver rcar_csi2_pdrv = {
> > --
> > 2.44.0
> >
>
> --
> Kind Regards,
> Niklas Söderlund

