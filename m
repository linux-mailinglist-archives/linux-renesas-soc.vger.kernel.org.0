Return-Path: <linux-renesas-soc+bounces-11127-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CF19E9AA9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 16:35:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B5021608BD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 15:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E59F1BEF8E;
	Mon,  9 Dec 2024 15:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="cJHTQ256";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="v3ON/mAM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EFE1B423A;
	Mon,  9 Dec 2024 15:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733758545; cv=none; b=dAbhnd/s09wJQtQ+veRVTv+Ne+dViTzcYUUooO+HudEY4V2gItC/CKnVcM6HeDwS3u+QTNgPzc2WTr+HGHL4TteJHbD1JGYzDOz6mwXquWMvv33sSvl1MWkN/Vr4WvFweiJJy+yACEh8uGVLy3I2T9STr364rk1e0+HyWt73ALI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733758545; c=relaxed/simple;
	bh=mi9U+mmJQmWWYB5cNp4IIbqwSGWdC0kR598UB1HzyhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=khjtxU5TNsrr8F7g0YRN8oBHyYQN7wxEj78u5li916cbzbOZuOdhcoeWyt+HooZe4QDRPfLAG2yBvOxjln/CN3sXyni7qR/sZWdMLvq0AlEmRHHB6eERRgjTPmk4hcVpOAGhKeemO5guk5GBFIZM3VT4CaTlSlOFnGLbAVmiv90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=cJHTQ256; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=v3ON/mAM; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 684831382149;
	Mon,  9 Dec 2024 10:35:40 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Mon, 09 Dec 2024 10:35:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1733758540;
	 x=1733844940; bh=UqTmVuRf/ET48EmyDo6o/jFH6W1/RdB8GETflEI8Mpk=; b=
	cJHTQ256PputfF4vM3G7MhLrUOgd3zajXUHRrHyhh1BIcOvZWoQM6K+4A0CW4Ebw
	SoVzSylOFzPycyt5icAwdL7p7/D4Niha45qt5K8iewXriCtMyuUYwa2jlRj4As16
	f1c7Y9jry2nZuN/aWBfNwd1+umO2VvFtON0Xg99MR8SXCKvKXvZDputXuAVUtm6X
	9fA8lTGfDaEqTCYfk0ci2co4piueaRR4q5za0YI57JpKZWSMEQtYgAeddLS461tP
	pL/CJ0DwfkYPNboKCRNmgr0/QXF7hC0U3BHa41Om4Nts6HTrm8K6XWUnDcTE6/C5
	ljBdMr74yTOQRlnSTwxiRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1733758540; x=
	1733844940; bh=UqTmVuRf/ET48EmyDo6o/jFH6W1/RdB8GETflEI8Mpk=; b=v
	3ON/mAMrFIhIiEhfo1u9RqGhICnd0g5KkBB/7LEBkQ7G9O5aA2I7cIo0/qZGPajq
	Tf4JoVtv3WM/5TKaBCAZWca+1GHE38Sn7g4PjlCtcKYtVoAIXuwDy/d+m6/TaHoV
	hffe8/RZ5psFiGhNjBRhyvWm5IREJ5NXmgx5wrDwHpbrdkYbd5rTE3xd86eayqx9
	MWkva8cTPzg37OVNB/VNenJM9SEl0fWoizHxWL68uK/ZM4bWxULxSogAmipKwRDE
	XNnH4zT2Jhfd1TV2coKyMubMi2bjxsMeBJath0xI59whYB0a7CWQ75dZy4G5PrAh
	5I1hYaWEe+fLCRF+okxDA==
X-ME-Sender: <xms:TA5XZ3XGEKdY-T9du7N2DSrmlyb9OpSrU01YCZi6JbqXXwwCSqb2ZA>
    <xme:TA5XZ_m5Q-brRWj6rl4oeLm9ZOaCqrWZNVvXKMQ2_vJFVKV2OGyz21m3-XLC2lN5K
    Ou-DkFmueccwzAL7xw>
X-ME-Received: <xmr:TA5XZzY92DoaLmsdEuVQPa4Z_-3Fz5fEg10ZJXfFXim8_CQGtSbkIPGloEFYt6V5oJqDosSwao1oMUiSnc00koCGI-EVci1-Ew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrjeeigdehudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeen
    ucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvg
    hrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthht
    vghrnhepfefhleelhfffjefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvle
    einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
    dpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhho
    sghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghsse
    hglhhiuggvrhdrsggvpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:TA5XZyUAvNu2sUDeUzaaI-PH-Vm3esd96smUSbw9tyLnrXkj5slq6A>
    <xmx:TA5XZxkSjetQUVFSVGfnEdAq55sJfOE6U-ZqPLferTXcYTCxRmirQg>
    <xmx:TA5XZ_fGReeQT6TxSQojD25tqfsVCZM0aBHzK78AhyUq80ceiCmsJg>
    <xmx:TA5XZ7EyyTmC0zt10KFWorWNwUZ24qYxIQ6Uf8b_yfsH5-hHV8xN1g>
    <xmx:TA5XZ3W045XPiGGQn9y8u3J5K4cxGYYp0Cu9SRN9KcJGtpTgEE7S4Y_B>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Dec 2024 10:35:39 -0500 (EST)
Date: Mon, 9 Dec 2024 16:35:36 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g0: Fix graph_child_address
 warnings from capture pipeline
Message-ID: <20241209153536.GA74826@ragnatech.se>
References: <20241016134819.1434340-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241016134819.1434340-1-niklas.soderlund+renesas@ragnatech.se>

Hi Rob,

Sorry to bother you but I wonder if you could help me understand why the 
dtc checker warns for the issues I tried to work around in this patch,
and if possible how I can improve my solution to get rid of the 
warnings.

This patch addresses the same problem for a few different devices. I 
will focus on the last one (/soc/isp@fed00000/ports/port@0) for my 
question, but all warnings here have the same issue.

I have a port node the represents a sink for a video input. This sink 
can either be connected to source A or source B, but not both at the 
same time. So each possible source is represented by an endpoint in the 
port node. Each endpoint have specific register address on the port bus 
that is described in the bindings as they map to different physical pins 
on the hardware.

The issue I have is that not all hardware configurations have both 
source A and B populated. All combinations of A, B and C are possible 
depending on the platform.

A)
    ports {
        ...
        port@0 {
            ...
            sourceA: endpoint@0 {
                reg = <0>
            };
            sourceB: endpoint@1 {
                reg = <1>
            };
        };
    };

B)
    ports {
        ...
        port@0 {
            ...
            sourceA: endpoint@0 {
                reg = <0>
            };
        };
    };

C)
    ports {
        ...
        port@0 {
            ...
            sourceB: endpoint@1 {
                reg = <1>
            };
        };
    };

For option A and C the checker is happy, but for option B the warnings 
this patch tries to address are triggered. While reading the 
dtc/checks.c I find check_graph_child_address() is the one that is 
triggering the warning. And this function explicitly checks for port 
buses with a single endpoint with a register value of 0.

This check was added way back in 2018 in commit df536831d02c ("checks: 
add graph binding checks"). But I can't find any information on the 
specifics. Is this design a bad idea for port buses for some reason I 
don't understand? AFIU this design is possible on other type of buses? 
And do you have any guidance on how I can dig myself out of this hole?

Thanks for your help.

On 2024-10-16 15:48:19 +0200, Niklas Söderlund wrote:
> The bindings for the R-Car video capture pipeline uses ports and
> endpoints to describe which IP is wired up and present on the different
> SoCs. It is needed to describe both which instance of an IP is
> connected, and to which port. The bindings try to be as reusable as
> possible across the different R-Car generations.
> 
> For example R-Car VIN IP bindings have three ports, where two of them
> can have multiple endpoints. Not all ports or endpoints are physically
> present on each generation and/or model of R-Car SoCs.
> 
> The users of the VIN bindings needs to know not only that a port have
> one, or more, endpoints but also which particular hardware instance it
> is. The bindings defines endpoint indexes to correspond to particular
> hardware instances that can be routed to a port to describe this.
> 
> This design leads to warnings when compiling the DTB if a port that can
> describe more then one endpoint only describes a single endpoint. And
> that endpoint corresponds to be the hardware the bindings defined to
> index 0. For example compiling R-Car V4H which includes r8a779g0.dtsi,
> 
>    ../r8a779g0.dtsi:1200.12-1210.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>    ../r8a779g0.dtsi:1228.12-1238.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>    ../r8a779g0.dtsi:1256.12-1266.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>    ../r8a779g0.dtsi:1284.12-1294.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>    ../r8a779g0.dtsi:1312.12-1322.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>    ../r8a779g0.dtsi:1340.12-1350.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>    ../r8a779g0.dtsi:1368.12-1378.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>    ../r8a779g0.dtsi:1396.12-1406.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>    ../r8a779g0.dtsi:2076.12-2086.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are
> 
> To avoid these warnings define all possible endpoints for each port in
> the video capture pipeline, but only set the remote-endpoint property if
> there is hardware present. This takes care of the warnings, but it also
> adds empty endpoints that are not connected to anything on that
> particular SoC.
> 
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> Hi Geert,
> 
> This only addresses the warnings on V4H. More boards do trigger these
> warnings but before I address them I thought it was a good idea we
> agreed if this is a good way forward.
> 
> In this design I have defined every possible endpoint for the ports
> involved. This might be a bit excessive as we define endpoints that are
> not physically possible for V4H. For example V4H only have 2 CSISP
> instances, while the bindings allow for up-to 4 CSISP as that is
> possible on V3U which the CSISP bindings are shared with.
> 
> I'm not sure where to best draw the line. Only adding empty endpoints if
> they are possible on the SoC sounds good, but what if we get a board
> with only a single CSISP for example? That would be a single endpoint
> with an index of 0, this triggering the warning.
> 
> Maybe do the minimum and only define an extra endpoint for ports that
> trigger the warning? And if it nots pysically possible for that SoC add
> a comment? This feels wrong however.
> 
> Let me know what you think. But it would be nice to get rid of these
> warnings one way or another.
> 
> Kind Regards,
> Niklas
> ---
>  arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 200 ++++++++++++++++++++++
>  1 file changed, 200 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> index 61c6b8022ffd..e3079562fe65 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -1364,6 +1364,18 @@ vin00isp0: endpoint@0 {
>  						reg = <0>;
>  						remote-endpoint = <&isp0vin00>;
>  					};
> +
> +					vin00isp1: endpoint@1 {
> +						reg = <1>;
> +					};
> +
> +					vin00isp2: endpoint@2 {
> +						reg = <2>;
> +					};
> +
> +					vin00isp3: endpoint@3 {
> +						reg = <3>;
> +					};
>  				};
>  			};
>  		};
> @@ -1393,6 +1405,18 @@ vin01isp0: endpoint@0 {
>  						reg = <0>;
>  						remote-endpoint = <&isp0vin01>;
>  					};
> +
> +					vin01isp1: endpoint@1 {
> +						reg = <1>;
> +					};
> +
> +					vin01isp2: endpoint@2 {
> +						reg = <2>;
> +					};
> +
> +					vin01isp3: endpoint@3 {
> +						reg = <3>;
> +					};
>  				};
>  			};
>  		};
> @@ -1422,6 +1446,18 @@ vin02isp0: endpoint@0 {
>  						reg = <0>;
>  						remote-endpoint = <&isp0vin02>;
>  					};
> +
> +					vin02isp1: endpoint@1 {
> +						reg = <1>;
> +					};
> +
> +					vin02isp2: endpoint@2 {
> +						reg = <2>;
> +					};
> +
> +					vin02isp3: endpoint@3 {
> +						reg = <3>;
> +					};
>  				};
>  			};
>  		};
> @@ -1451,6 +1487,18 @@ vin03isp0: endpoint@0 {
>  						reg = <0>;
>  						remote-endpoint = <&isp0vin03>;
>  					};
> +
> +					vin03isp1: endpoint@1 {
> +						reg = <1>;
> +					};
> +
> +					vin03isp2: endpoint@2 {
> +						reg = <2>;
> +					};
> +
> +					vin03isp3: endpoint@3 {
> +						reg = <3>;
> +					};
>  				};
>  			};
>  		};
> @@ -1480,6 +1528,18 @@ vin04isp0: endpoint@0 {
>  						reg = <0>;
>  						remote-endpoint = <&isp0vin04>;
>  					};
> +
> +					vin04isp1: endpoint@1 {
> +						reg = <1>;
> +					};
> +
> +					vin04isp2: endpoint@2 {
> +						reg = <2>;
> +					};
> +
> +					vin04isp3: endpoint@3 {
> +						reg = <3>;
> +					};
>  				};
>  			};
>  		};
> @@ -1509,6 +1569,18 @@ vin05isp0: endpoint@0 {
>  						reg = <0>;
>  						remote-endpoint = <&isp0vin05>;
>  					};
> +
> +					vin05isp1: endpoint@1 {
> +						reg = <1>;
> +					};
> +
> +					vin05isp2: endpoint@2 {
> +						reg = <2>;
> +					};
> +
> +					vin05isp3: endpoint@3 {
> +						reg = <3>;
> +					};
>  				};
>  			};
>  		};
> @@ -1538,6 +1610,18 @@ vin06isp0: endpoint@0 {
>  						reg = <0>;
>  						remote-endpoint = <&isp0vin06>;
>  					};
> +
> +					vin06isp1: endpoint@1 {
> +						reg = <1>;
> +					};
> +
> +					vin06isp2: endpoint@2 {
> +						reg = <2>;
> +					};
> +
> +					vin06isp3: endpoint@3 {
> +						reg = <3>;
> +					};
>  				};
>  			};
>  		};
> @@ -1567,6 +1651,18 @@ vin07isp0: endpoint@0 {
>  						reg = <0>;
>  						remote-endpoint = <&isp0vin07>;
>  					};
> +
> +					vin07isp1: endpoint@1 {
> +						reg = <1>;
> +					};
> +
> +					vin07isp2: endpoint@2 {
> +						reg = <2>;
> +					};
> +
> +					vin07isp3: endpoint@3 {
> +						reg = <3>;
> +					};
>  				};
>  			};
>  		};
> @@ -1592,10 +1688,22 @@ port@2 {
>  
>  					reg = <2>;
>  
> +					vin08isp0: endpoint@0 {
> +						reg = <0>;
> +					};
> +
>  					vin08isp1: endpoint@1 {
>  						reg = <1>;
>  						remote-endpoint = <&isp1vin08>;
>  					};
> +
> +					vin08isp2: endpoint@2 {
> +						reg = <2>;
> +					};
> +
> +					vin08isp3: endpoint@3 {
> +						reg = <3>;
> +					};
>  				};
>  			};
>  		};
> @@ -1621,10 +1729,22 @@ port@2 {
>  
>  					reg = <2>;
>  
> +					vin09isp0: endpoint@0 {
> +						reg = <0>;
> +					};
> +
>  					vin09isp1: endpoint@1 {
>  						reg = <1>;
>  						remote-endpoint = <&isp1vin09>;
>  					};
> +
> +					vin09isp2: endpoint@2 {
> +						reg = <2>;
> +					};
> +
> +					vin09isp3: endpoint@3 {
> +						reg = <3>;
> +					};
>  				};
>  			};
>  		};
> @@ -1650,10 +1770,22 @@ port@2 {
>  
>  					reg = <2>;
>  
> +					vin10isp0: endpoint@0 {
> +						reg = <0>;
> +					};
> +
>  					vin10isp1: endpoint@1 {
>  						reg = <1>;
>  						remote-endpoint = <&isp1vin10>;
>  					};
> +
> +					vin10isp2: endpoint@2 {
> +						reg = <2>;
> +					};
> +
> +					vin10isp3: endpoint@3 {
> +						reg = <3>;
> +					};
>  				};
>  			};
>  		};
> @@ -1679,10 +1811,22 @@ port@2 {
>  
>  					reg = <2>;
>  
> +					vin11isp0: endpoint@0 {
> +						reg = <0>;
> +					};
> +
>  					vin11isp1: endpoint@1 {
>  						reg = <1>;
>  						remote-endpoint = <&isp1vin11>;
>  					};
> +
> +					vin11isp2: endpoint@2 {
> +						reg = <2>;
> +					};
> +
> +					vin11isp3: endpoint@3 {
> +						reg = <3>;
> +					};
>  				};
>  			};
>  		};
> @@ -1708,10 +1852,22 @@ port@2 {
>  
>  					reg = <2>;
>  
> +					vin12isp0: endpoint@0 {
> +						reg = <0>;
> +					};
> +
>  					vin12isp1: endpoint@1 {
>  						reg = <1>;
>  						remote-endpoint = <&isp1vin12>;
>  					};
> +
> +					vin12isp2: endpoint@2 {
> +						reg = <2>;
> +					};
> +
> +					vin12isp3: endpoint@3 {
> +						reg = <3>;
> +					};
>  				};
>  			};
>  		};
> @@ -1737,10 +1893,22 @@ port@2 {
>  
>  					reg = <2>;
>  
> +					vin13isp0: endpoint@0 {
> +						reg = <0>;
> +					};
> +
>  					vin13isp1: endpoint@1 {
>  						reg = <1>;
>  						remote-endpoint = <&isp1vin13>;
>  					};
> +
> +					vin13isp2: endpoint@2 {
> +						reg = <2>;
> +					};
> +
> +					vin13isp3: endpoint@3 {
> +						reg = <3>;
> +					};
>  				};
>  			};
>  		};
> @@ -1766,10 +1934,22 @@ port@2 {
>  
>  					reg = <2>;
>  
> +					vin14isp0: endpoint@0 {
> +						reg = <0>;
> +					};
> +
>  					vin14isp1: endpoint@1 {
>  						reg = <1>;
>  						remote-endpoint = <&isp1vin14>;
>  					};
> +
> +					vin14isp2: endpoint@2 {
> +						reg = <2>;
> +					};
> +
> +					vin14isp3: endpoint@3 {
> +						reg = <3>;
> +					};
>  				};
>  			};
>  		};
> @@ -1795,10 +1975,22 @@ port@2 {
>  
>  					reg = <2>;
>  
> +					vin15isp0: endpoint@0 {
> +						reg = <0>;
> +					};
> +
>  					vin15isp1: endpoint@1 {
>  						reg = <1>;
>  						remote-endpoint = <&isp1vin15>;
>  					};
> +
> +					vin15isp2: endpoint@2 {
> +						reg = <2>;
> +					};
> +
> +					vin15isp3: endpoint@3 {
> +						reg = <3>;
> +					};
>  				};
>  			};
>  		};
> @@ -2251,6 +2443,10 @@ isp0csi40: endpoint@0 {
>  						reg = <0>;
>  						remote-endpoint = <&csi40isp0>;
>  					};
> +
> +					isp0csi41: endpoint@1 {
> +						reg = <1>;
> +					};
>  				};
>  
>  				port@1 {
> @@ -2331,6 +2527,10 @@ port@0 {
>  
>  					reg = <0>;
>  
> +					isp1csi40: endpoint@0 {
> +						reg = <0>;
> +					};
> +
>  					isp1csi41: endpoint@1 {
>  						reg = <1>;
>  						remote-endpoint = <&csi41isp1>;
> -- 
> 2.46.2
> 

-- 
Kind Regards,
Niklas Söderlund

